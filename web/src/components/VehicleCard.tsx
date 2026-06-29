import { useState } from 'react'
import type { Vehicle } from '../types'

interface VehicleCardProps {
  vehicle: Vehicle
  category: string
  onSpawn: (model: string) => void
}

const REMOTE = (model: string) => `https://docs.fivem.net/vehicles/${model}.webp`
const LOCAL = (model: string) => `./images/${model}.png`
const FALLBACK = './images/fallback.png'

export default function VehicleCard({ vehicle, category, onSpawn }: VehicleCardProps) {
  const { model, label } = vehicle
  // Image source falls back: docs.fivem.net -> local png -> fallback png.
  const [src, setSrc] = useState(REMOTE(model))
  const isFallback = src === FALLBACK

  const onError = () => {
    if (src === REMOTE(model)) setSrc(LOCAL(model))
    else if (src === LOCAL(model)) setSrc(FALLBACK)
  }

  return (
    <div className="group flex flex-col overflow-hidden rounded-xl border border-line/60 bg-panel transition-all hover:border-accent/60 hover:shadow-[0_0_0_1px_rgba(138,180,248,0.4)]">
      <div className="relative flex aspect-[16/10] items-center justify-center overflow-hidden bg-gradient-to-b from-panel2/40 to-bg/40">
        <span className="absolute right-2 top-2 rounded-full border border-accent/20 bg-accent-soft px-2 py-0.5 text-[10px] uppercase tracking-wide text-accent">
          {category}
        </span>
        <img
          src={src}
          alt={label}
          loading="lazy"
          onError={onError}
          className={`h-[78%] w-[82%] object-contain transition-transform duration-300 group-hover:scale-105 ${
            isFallback ? 'opacity-40 grayscale' : ''
          }`}
        />
      </div>

      <div className="flex flex-1 flex-col gap-2.5 p-4">
        <div className="min-w-0">
          <div
            className="line-clamp-2 text-[15px] font-semibold leading-snug text-text"
            title={label}
          >
            {label}
          </div>
          <div className="truncate font-mono text-xs text-muted" title={model}>
            {model}
          </div>
        </div>

        <button
          type="button"
          onClick={() => onSpawn(model)}
          className="mt-auto flex items-center justify-center gap-2 rounded-lg border border-accent/50 bg-accent-soft py-2.5 text-sm font-semibold uppercase tracking-wide text-accent transition-all hover:bg-accent hover:text-bg"
        >
          Spawn
        </button>
      </div>
    </div>
  )
}
