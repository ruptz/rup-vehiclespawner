import type { RGB } from '../types'
import { hexToRgb, rgbToHex } from '../lib/color'

interface ColorFieldProps {
  label: string
  value: RGB
  onChange: (value: RGB) => void
}

export default function ColorField({ label, value, onChange }: ColorFieldProps) {
  return (
    <div className="flex items-center justify-between gap-3 rounded-lg bg-panel2/60 px-3 py-2">
      <span className="text-xs uppercase tracking-wide text-muted">{label}</span>
      <div className="flex items-center gap-2">
        <span className="font-mono text-[11px] text-muted">
          {value.r}, {value.g}, {value.b}
        </span>
        <label className="relative h-7 w-9 cursor-pointer overflow-hidden rounded-md border border-line">
          <span className="absolute inset-0" style={{ backgroundColor: rgbToHex(value) }} />
          <input
            type="color"
            value={rgbToHex(value)}
            onChange={(e) => onChange(hexToRgb(e.target.value))}
            className="absolute inset-0 cursor-pointer opacity-0"
          />
        </label>
      </div>
    </div>
  )
}
