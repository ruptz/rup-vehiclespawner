import { Gauge, Paintbrush, PackagePlus } from 'lucide-react'
import type { RGB, SpawnOptions } from '../types'
import Toggle from './Toggle'
import ColorField from './ColorField'

interface OptionsPanelProps {
  addonOnly: boolean
  setAddonOnly: (v: boolean) => void
  options: SpawnOptions
  setOptions: (updater: (prev: SpawnOptions) => SpawnOptions) => void
}

export default function OptionsPanel({
  addonOnly,
  setAddonOnly,
  options,
  setOptions,
}: OptionsPanelProps) {
  const setPrimary = (primary: RGB) => setOptions((p) => ({ ...p, primary }))
  const setSecondary = (secondary: RGB) => setOptions((p) => ({ ...p, secondary }))

  return (
    <div className="flex flex-col gap-2">
      <h3 className="px-1 pb-1 text-xs font-semibold uppercase tracking-wider text-muted">
        Spawn Options
      </h3>

      <Toggle
        label="Add-on only"
        checked={addonOnly}
        onChange={setAddonOnly}
        icon={<PackagePlus size={16} className="text-accent" />}
      />

      <Toggle
        label="Max performance"
        checked={options.maxTuned}
        onChange={(maxTuned) => setOptions((p) => ({ ...p, maxTuned }))}
        icon={<Gauge size={16} className="text-accent" />}
      />

      <Toggle
        label="Custom paint"
        checked={options.applyColor}
        onChange={(applyColor) => setOptions((p) => ({ ...p, applyColor }))}
        icon={<Paintbrush size={16} className="text-accent" />}
      />

      {options.applyColor && (
        <div className="flex flex-col gap-2 pl-1">
          <ColorField label="Primary" value={options.primary} onChange={setPrimary} />
          <ColorField label="Secondary" value={options.secondary} onChange={setSecondary} />
        </div>
      )}
    </div>
  )
}
