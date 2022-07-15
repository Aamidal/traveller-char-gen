module Careers

  NAVY = {
    enlistment: {dm: 8, int: 8, edu: 9}
    survival: {dm: 5, int: 7}
    commission: {dm: 10, soc: 9}
    promotion: {dm: 8, edu:8}
    reenlist: 6
    ranks: ['Ensign', 'Lieutenant', 'Lt Cmdr',
            'Commander', 'Captain', 'Admiral']
    muster: [
      ['low psg', '+1 INT', '+2 EDU', 'blade', 'travellers',
       'high psg', '+2 SOC'],
      [1000, 5000, 5000, 10000, 20000, 50000, 50000]
    ]
  }

  MARINES = {
    enlistment: {dm: 9, int: 8, str: 8}
    survival: {dm: 6, end: 8}
    commission: {dm: 9, edu: 7}
    promotion: {dm: 9, soc: 8}
    reenlist: 6
    ranks: ['Lieutenant', 'Captain', 'Force Cmdr',
            'Lt Colonel', 'Colonel', 'Brigadier']
    muster: [
      ['low psg', '+2 INT', '+1 EDU', 'blade', 'travellers',
       'high psg', '+2 SOC'],
      [2000, 5000, 5000, 10000, 20000, 30000, 40000]
    ]
  }

  ARMY = {
    enlistment: {dm: 5, dex: 6, end: 5}
    survival: {dm: 5, edu: 6}
    commission: {dm: 5, end: 7}
    promotion: {dm: 6, edu: 7}
    reenlist: 7
    ranks: ['Lieutenant', 'Captain', 'Major', 
            'Lt Colonel', 'Colonel', 'General']
    muster: [
      ['low psg', '+1 INT', '+2 EDU', 'gun', 'high psg',
       'mid psg', '+1 SOC'],
      [2000, 5000, 10000, 10000, 10000, 20000, 30000]
    ]
  }

  SCOUTS = {
    enlistment: {dm: 7, int: 6, str: 8}
    survival: {dm: 7, end: 9}
    reenlist: 3
    muster: [
      ['low psg', '+2 INT', '+2 EDU', 'blade', 'gun',
       'scout ship'],
      [20000, 20000, 30000, 30000, 50000, 50000, 50000]
    ]
  }

  MERCHANTS = {
    enlistment: {dm: 7, str: 7, int: 6}
    survival: {dm: 5, int: 7}
    commission: {dm: 4, int: 6}
    promotion: {dm: 10, int: 9}
    reenlist: 4
    ranks: ['4th Officer', '3rd Officer', '2nd Officer', 
            '1st Officer', 'Captain']
    muster: [
      ['low psg', '+1 INT', '+1 EDU', 'gun', 'blade'
       'low psg', 'merchant ship'],
      [1000, 5000, 10000, 20000, 20000, 40000, 40000]
    ]
  }

  OTHER = {
    enlistment: {dm: 3}
    survival: {dm: 5, int: 9}
    reenlist: 5
    muster: [
      ['low psg', '+1 INT', '+1 EDU', 'gun', 'high psg'],
      [1000, 5000, 10000, 10000, 10000, 50000, 100000]
    ]
  }

  SERVICES = [NAVY, MARINES, ARMY, SCOUTS, MERCHANTS, OTHER]

  def self.draft
    SERVICES.sample
  end
end