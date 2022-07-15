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
    skills: [
      ['+1 STR,' '+1 DEX', '+1 END', '+1 SOC', '+1 INT', '+1 EDU'],
      ["Ship's Boat", 'Vacc Suit', 'Fwd Obsv', 'Blade Cbt', 'Gun Cbt', 'Gunnery'],
      ['Vacc Suit', 'Mechanical', 'Electronic', 'Engineering', 'Gunnery', 'J-o-t'],
      ['Medical', 'Navigation', 'Engineering', 'Computer', 'Pilot', 'Admin'],
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
    skills: [
      ['+1 STR,' '+1 DEX', '+1 END', 'Gambling', 'Brawling', 'Blade Cbt'],
      ['ATV', 'Vacc Suit', 'Blade Cbt', 'Blade Cbt', 'Gun Cbt', 'Gun Cbt'],
      ['ATV', 'Mechanical', 'Electronic', 'Tactics', 'Blade Cbt', 'Gun Cbt'],
      ['Medical','Tactics', 'Tactics', 'Computer', 'Leader', 'Admin']
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
    skills: [
      ['+1 STR,' '+1 DEX', '+1 END', 'Gambling', 'Brawling', '+1 EDU']
      ['ATV', 'Air/Raft', 'Fwd Obsv', 'Blade Cbt', 'Gun Cbt', 'Gun Cbt'],
      ['ATV', 'Mechanical', 'Electronic', 'Tactics', 'Blade Cbt', 'Gun Cbt'],
      ['Medical', 'Tactics', 'Tactics', 'Computer', 'Leader', 'Admin']
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
    skills: [
      ['+1 STR,' '+1 DEX', '+1 END', 'Gun Cbt', '+1 INT', '+1 EDU'],
      ['Air/Raft', 'Vacc Suit', 'Navigation', 'Mechanical', 'Electronic', 'J-o-T'],
      ['Air/Raft', 'Mechanical', 'Electronic', 'J-o-T', 'Gunnery', 'Medical'],
      ['Medical', 'Navigation', 'Engineering', 'Computer', 'Pilot', 'J-o-T']
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
    skills: [
      ['+1 STR,' '+1 DEX', '+1 END', '+1 STR', 'Blade Cbt', 'Bribery'],
      ['Steward', 'Vacc Suit', '+1 STR', 'Gun Cbt', 'Electronic', 'J-o-T'],
      ['Streetwise', 'Mechanical', 'Electronic', 'Navigation', 'Gunnery', 'Medical'],
      ['Medical', 'Navigation', 'Engineering', 'Computer', 'Pilot', 'Admin']
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
    skills: [
      ['+1 STR', '+1 DEX', '+1 END', 'Blade Cbt', 'Brawling', '-1 SOC'],
      ['Forgery', 'Gambling', 'Brawling', 'Blade Cbt', 'Gun Cbt', 'Bribery'],
      ['Streetwise', 'Mechanical', 'Electronic', 'Gambling', 'Brawling', 'Forgery']
      ['Medical', 'Forgery', 'Electronics', 'Computer', 'Streetwise', 'J-o-T']
    ]
  }

  SERVICES = [NAVY, MARINES, ARMY, SCOUTS, MERCHANTS, OTHER]

  def self.draft
    SERVICES.sample
  end
end