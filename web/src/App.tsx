import { useEffect, useMemo, useState } from 'react'
import { Search, X } from 'lucide-react'
import type { SpawnOptions, Vehicle, VehicleModels } from './types'
import { fetchNui, isEnvBrowser } from './lib/nui'
import { useNuiEvent } from './hooks/useNuiEvent'
import { devVehicleModels } from './lib/devData'
import Sidebar from './components/Sidebar'
import OptionsPanel from './components/OptionsPanel'
import VehicleCard from './components/VehicleCard'

interface Entry {
  vehicle: Vehicle
  category: string
}

const DEFAULT_OPTIONS: SpawnOptions = {
  applyColor: false,
  primary: { r: 255, g: 255, b: 255 },
  secondary: { r: 17, g: 17, b: 17 },
  maxTuned: false,
}

export default function App() {
  const [models, setModels] = useState<VehicleModels>({})
  const [visible, setVisible] = useState(false)
  const [search, setSearch] = useState('')
  const [currentCategory, setCurrentCategory] = useState('All')
  const [addonOnly, setAddonOnly] = useState(false)
  const [options, setOptions] = useState<SpawnOptions>(DEFAULT_OPTIONS)

  useNuiEvent<{ models: VehicleModels }>('setVehicleModels', (data) => {
    setModels(data.models ?? {})
  })
  useNuiEvent('openUI', () => setVisible(true))

  const close = () => {
    setVisible(false)
    setSearch('')
    fetchNui('closeUI')
  }

  // ESC close menu yipper.
  useEffect(() => {
    const onKey = (e: KeyboardEvent) => {
      if (e.key === 'Escape' && visible) close()
    }
    window.addEventListener('keydown', onKey)
    return () => window.removeEventListener('keydown', onKey)
  }, [visible])

  useEffect(() => {
    if (isEnvBrowser()) {
      setModels(devVehicleModels)
      setVisible(true)
    }
  }, [])

  const realEntries = useMemo<Entry[]>(
    () =>
      Object.entries(models)
        .filter(([category]) => category !== 'Add-on')
        .flatMap(([category, list]) => list.map((vehicle) => ({ vehicle, category }))),
    [models],
  )

  const addonSet = useMemo(
    () => new Set((models['Add-on'] ?? []).map((v) => v.model)),
    [models],
  )

  const counts = useMemo(() => {
    const c: Record<string, number> = {}
    if (addonOnly) {
      const addons = realEntries.filter((e) => addonSet.has(e.vehicle.model))
      c.All = addons.length
      for (const e of addons) c[e.category] = (c[e.category] ?? 0) + 1
      c['Add-on'] = addons.length
    } else {
      c.All = realEntries.length
      for (const [category, list] of Object.entries(models)) c[category] = list.length
    }
    return c
  }, [models, realEntries, addonSet, addonOnly])

  const categories = useMemo(
    () => ['All', ...Object.keys(models).sort((a, b) => a.localeCompare(b))],
    [models],
  )

  const visibleVehicles = useMemo(() => {
    let pool: Entry[]
    if (currentCategory === 'All') pool = realEntries
    else if (currentCategory === 'Add-on')
      pool = (models['Add-on'] ?? []).map((vehicle) => ({ vehicle, category: 'Add-on' }))
    else pool = realEntries.filter((e) => e.category === currentCategory)

    if (addonOnly) pool = pool.filter((e) => addonSet.has(e.vehicle.model))

    const term = search.trim().toLowerCase()
    if (term) {
      pool = pool.filter(
        (e) =>
          e.vehicle.model.toLowerCase().includes(term) ||
          e.vehicle.label.toLowerCase().includes(term),
      )
    }
    return [...pool].sort((a, b) => a.vehicle.label.localeCompare(b.vehicle.label))
  }, [realEntries, models, addonSet, addonOnly, currentCategory, search])

  const spawn = (model: string) => {
    fetchNui('spawnVehicle', { model, options })
    close()
  }

  if (!visible) return null

  const baseHeading = currentCategory === 'All' ? 'All Vehicles' : currentCategory
  const heading = addonOnly ? `${baseHeading} · Add-on only` : baseHeading

  return (
    <div className="fixed inset-0 flex items-center justify-center p-6">
      <div className="flex h-[90vh] w-[min(1600px,96vw)] flex-col overflow-hidden rounded-2xl border border-line/50 bg-bg shadow-2xl">
        {/* Header */}
        <header className="flex items-center gap-5 border-b border-line/50 px-7 py-5">
          <div className="relative flex-1">
            <Search
              size={18}
              className="pointer-events-none absolute left-4 top-1/2 -translate-y-1/2 text-muted"
            />
            <input
              autoFocus
              value={search}
              onChange={(e) => setSearch(e.target.value)}
              placeholder="Search by name or spawn code..."
              className="w-full rounded-full border border-line bg-panel py-3 pl-11 pr-4 text-base text-text outline-none placeholder:text-muted focus:border-accent"
            />
          </div>
          <button
            type="button"
            onClick={close}
            className="rounded-full p-2.5 text-muted transition-colors hover:bg-white/5 hover:text-text"
          >
            <X size={22} />
          </button>
        </header>

        <div className="flex min-h-0 flex-1">
          {/* Sidebar */}
          <aside className="flex w-72 shrink-0 flex-col gap-4 border-r border-line/50 bg-panel/40 p-4">
            <Sidebar
              categories={categories}
              current={currentCategory}
              counts={counts}
              onSelect={setCurrentCategory}
            />
            <div className="mt-auto border-t border-line/50 pt-3">
              <OptionsPanel
                addonOnly={addonOnly}
                setAddonOnly={setAddonOnly}
                options={options}
                setOptions={setOptions}
              />
            </div>
          </aside>

          {/* Main */}
          <main className="flex min-w-0 flex-1 flex-col">
            <div className="flex items-center justify-between px-7 py-4">
              <h2 className="font-display text-xl uppercase tracking-wide text-text">{heading}</h2>
              <span className="text-sm text-muted">{visibleVehicles.length} vehicles</span>
            </div>
            <div className="min-h-0 flex-1 overflow-y-auto px-7 pb-7">
              {visibleVehicles.length === 0 ? (
                <div className="flex h-full items-center justify-center text-sm text-muted">
                  No vehicles found.
                </div>
              ) : (
                <div className="grid grid-cols-[repeat(auto-fill,minmax(230px,1fr))] gap-5">
                  {visibleVehicles.map(({ vehicle, category }) => (
                    <VehicleCard
                      key={`${category}:${vehicle.model}`}
                      vehicle={vehicle}
                      category={category}
                      onSpawn={spawn}
                    />
                  ))}
                </div>
              )}
            </div>
          </main>
        </div>
      </div>
    </div>
  )
}
