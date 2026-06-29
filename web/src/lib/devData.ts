import type { VehicleModels } from '../types'

/** Mock data so I can see what TS looks like 0-0 */
export const devVehicleModels: VehicleModels = {
  Super: [
    { model: 'adder', label: 'Adder' },
    { model: 'zentorno', label: 'Zentorno' },
    { model: 't20', label: 'T20' },
    { model: 'krieger', label: 'Krieger' },
  ],
  Sports: [
    { model: 'elegy', label: 'Elegy RH8' },
    { model: 'sultanrs', label: 'Sultan RS' },
    { model: 'comet2', label: 'Comet' },
  ],
  Sedans: [
    { model: 'asea', label: 'Asea' },
    { model: 'tailgater', label: 'Tailgater' },
  ],
  'Add-on': [
    { model: 'testcar1', label: 'Addon Car 1' },
    { model: 'testcar2', label: 'Addon Car 2' },
  ],
}
