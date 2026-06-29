interface ToggleProps {
  label: string
  checked: boolean
  onChange: (value: boolean) => void
  icon?: React.ReactNode
}

export default function Toggle({ label, checked, onChange, icon }: ToggleProps) {
  return (
    <button
      type="button"
      onClick={() => onChange(!checked)}
      className="flex w-full items-center justify-between gap-3 rounded-lg bg-panel2/60 px-3 py-2.5 text-left transition-colors hover:bg-panel2"
    >
      <span className="flex items-center gap-2 text-sm text-text">
        {icon}
        {label}
      </span>
      <span
        className={`relative h-5 w-9 shrink-0 rounded-full transition-colors ${
          checked ? 'bg-accent' : 'bg-line'
        }`}
      >
        <span
          className={`absolute top-0.5 h-4 w-4 rounded-full bg-white transition-transform ${
            checked ? 'translate-x-4' : 'translate-x-0.5'
          }`}
        />
      </span>
    </button>
  )
}
