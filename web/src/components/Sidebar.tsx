import {
  Bike,
  Car,
  LayoutGrid,
  PackagePlus,
  Plane,
  Ship,
  Siren,
  TrainFront,
  Truck,
  Wrench,
  type LucideIcon,
} from 'lucide-react'

const ICONS: Record<string, LucideIcon> = {
  All: LayoutGrid,
  'Add-on': PackagePlus,
  Motorcycles: Bike,
  Cycles: Bike,
  Planes: Plane,
  Boats: Ship,
  Trains: TrainFront,
  Emergency: Siren,
  Commercial: Truck,
  Industrial: Truck,
  Utility: Wrench,
}

interface SidebarProps {
  categories: string[]
  current: string
  counts: Record<string, number>
  onSelect: (category: string) => void
}

export default function Sidebar({ categories, current, counts, onSelect }: SidebarProps) {
  return (
    <nav className="flex flex-col gap-1 overflow-y-auto pr-1">
      {categories.map((category) => {
        const Icon = ICONS[category] ?? Car
        const active = category === current
        return (
          <button
            key={category}
            type="button"
            onClick={() => onSelect(category)}
            className={`flex items-center justify-between gap-2 rounded-lg px-3 py-2 text-sm transition-colors ${
              active ? 'bg-accent font-semibold text-bg' : 'text-text hover:bg-white/5'
            }`}
          >
            <span className="flex items-center gap-2.5 truncate">
              <Icon size={16} className={active ? 'text-bg' : 'text-accent'} />
              <span className="truncate">{category}</span>
            </span>
            <span
              className={`shrink-0 rounded-full px-1.5 text-[10px] ${
                active ? 'bg-bg/20 text-bg' : 'bg-white/5 text-muted'
              }`}
            >
              {counts[category] ?? 0}
            </span>
          </button>
        )
      })}
    </nav>
  )
}
