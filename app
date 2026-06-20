```react
import React, { useState, useEffect, useMemo } from 'react';
import { 
  Shield, 
  HeartPulse, 
  Activity, 
  FileText, 
  MapPin, 
  Users, 
  TrendingUp, 
  Video, 
  AlertTriangle, 
  Cpu, 
  Database, 
  Search, 
  Share2, 
  FileDown, 
  Send, 
  Calendar,
  CheckCircle,
  XCircle,
  Copy,
  ChevronRight,
  Sparkles,
  Layers,
  Sliders,
  HelpCircle,
  ExternalLink,
  Laptop,
  DollarSign,
  Phone,
  Mail,
  Filter,
  ArrowUpDown
} from 'lucide-react';

// ==========================================
// HIGH-FIDELITY DATASETS
// ==========================================

const HealthNetworks = [
  {
    id: 'va-visn8',
    name: 'VA VISN 8 Network',
    color: 'from-blue-600 to-indigo-700',
    description: 'Veteran Affairs Sunshine Healthcare Network'
  },
  {
    id: 'baptist',
    name: 'Baptist Health South Florida',
    color: 'from-emerald-600 to-teal-700',
    description: 'The region\'s premier non-profit faith-based system'
  },
  {
    id: 'jackson',
    name: 'Jackson Health System',
    color: 'from-cyan-600 to-blue-700',
    description: 'One of the nation\'s largest public academic systems'
  },
  {
    id: 'tenet',
    name: 'Tenet / Palm Beach Health Network',
    color: 'from-orange-600 to-rose-700',
    description: 'Commercial regional giants'
  },
  {
    id: 'broward',
    name: 'Broward Health',
    color: 'from-purple-600 to-indigo-700',
    description: 'Northern Broward county public healthcare district'
  },
  {
    id: 'mhs',
    name: 'Memorial Healthcare System',
    color: 'from-indigo-600 to-purple-700',
    description: 'Southern Broward county public safety-net system'
  }
];

const AccountsData = [
  {
    id: 'good-sam',
    name: 'Good Samaritan Medical Center',
    network: 'tenet',
    size: 333,
    location: 'West Palm Beach, FL',
    contactName: 'Billie Young',
    contactTitle: 'IT Director (PBHN / Delray)',
    keyLeadership: {
      regionalGroupPresident: 'Maggie Gill',
      hospitalCEO: 'Sherri Montgomery (former Group CFO)',
      materialsManagement: 'James Watson'
    },
    status: 'High Opportunity (Redevelopment)',
    emramStage: 'Stage 5',
    riskScore: 'High (Manual Device Oversight)',
    dealStage: 'BPA Alignment & Security Posture Review',
    clinicalPriorities: 'Genomic and metabolic profiling, luxury smart-room integration, transition from sick care to proactive wellness.',
    notes: 'Undergoing a $2-3B smart medical campus/longevity district expansion. Standard hospital IT does not suffice—requires high interoperability. Billie Young is the operational pivot point between corporate strategy (Dallas) and physical implementation.',
    actionItems: [
      'Present custom Service Level Agreement (SLA) modeled on VISN 7 success.',
      'Coordinate with Derek Collins (Group Chief Strategy Officer) on smart-room longevity tech integration.',
      'Highlight on-floor ergonomic difference of Steer Assist casters for high-acuity suites.'
    ]
  },
  {
    id: 'miami-va',
    name: 'Bruce W. Carter Miami VA Medical Center',
    network: 'va-visn8',
    size: 450,
    location: 'Miami, FL',
    contactName: 'Jissy Titus, DNP, RN, NI-BC',
    contactTitle: 'Chief Nursing Informatics Officer',
    keyLeadership: {
      cmio: 'Robert Rivas',
      biomedLead: 'Marcellus Milton',
      pacsAdmin: 'Jose Valentin'
    },
    status: 'Active Pipeline',
    emramStage: 'Stage 6',
    riskScore: 'Medium (Updating Fleet)',
    dealStage: '20 Care Pros Purchased, 100+ Pipeline',
    clinicalPriorities: 'Barcoded Medication Administration (BCMA) compliance, Cerner/Oracle migration prep, reducing nurse cognitive burden.',
    notes: 'Successfully switched PC configuration from HP to Dell to secure funding approval. Demoed Care Pro cart to Chief Rivas and biomed. Jissy Titus approved of the specialized cart configuration containing extended poles for globe cameras to improve virtual-sitter visibility. PACS Admin Jose Valentin joining biomed for smoother clinical workflows.',
    actionItems: [
      'Ship double-RFID bracket options to Jissy to test and experience before full roll-out.',
      'Deliver quote for 13 code scanners under $15k so they can purchase on credit card.',
      'Design custom "Biomed Test Cart" mimicking the Hi-Focus setup per Roberto\'s request.'
    ]
  },
  {
    id: 'jackson-hq',
    name: 'Jackson Memorial Hospital (HQ)',
    network: 'jackson',
    size: 2139,
    location: 'Miami, FL',
    contactName: 'Daniel Rojas',
    contactTitle: 'IT Director',
    keyLeadership: {
      telehealthLead: 'Daniel Cruz',
      complianceHead: 'Raul Ordonez',
      samsungCoord: 'Daniel Rojas'
    },
    status: 'Hot Deal (Scale Play)',
    emramStage: 'Stage 5',
    riskScore: 'High (Massive Fleet Complexity)',
    dealStage: 'Yealink Rooms Competition & Interactive Displays',
    clinicalPriorities: 'Telehealth implementation for a new clinical tower, workspace consolidation, rapid bedside response visualization.',
    notes: 'Finalized medical cart configuration using a custom extended pole to clear clinical monitors. Enormous opportunity unlocked for Yealink MVC S40 video conferencing kits (all-in-one with Mini-PC and SmartVision 40 camera) for 1,000 rooms. Currently competing with CDW—needs 100 rooms completed immediately.',
    actionItems: [
      'Lock in joint session with Samsung reps for interactive whiteboards to meet COO deadlines.',
      'Generate customized Yealink configuration quotes for initial 100-room pilot.',
      'Demonstrate how Armis asset intelligence protects the new 1,000 video endpoints in real time.'
    ]
  },
  {
    id: 'uhealth-miami',
    name: 'UHealth - University of Miami Health System',
    network: 'jackson',
    size: 602,
    location: 'Miami, FL',
    contactName: 'Jermaine Chin',
    contactTitle: 'Technology Director',
    keyLeadership: {
      executiveDirector: 'Brandon',
      supportTeam: 'Kevin Long / LaDonovan'
    },
    status: 'Active Audit Resolution',
    emramStage: 'Stage 6',
    riskScore: 'High (Compliance Warning)',
    dealStage: 'Prototype retrofitting & 12 Care Pros shipped',
    clinicalPriorities: 'Auto-lock medicine cabinet compliance, hardware standardization across off-site clinical hubs.',
    notes: 'System was recently audited and placed under a compliance warning due to old medication drawers lacking automatic locking timers. Howard engineering designed a custom 3D-printed retrofit lock for their existing Core carts, saving them millions while moving them to the Care Pro WoW.',
    actionItems: [
      'Verify delivery schedule of 20 pieces per week of 3D-printed retrofit locking gears.',
      'Deliver final matched pricing quote for 20 washable medical keyboards and mice to consolidate vendors.',
      'Deliver 12 Care Pro carts to the Boca campus and organize local on-site training.'
    ]
  },
  {
    id: 'broward-hq',
    name: 'Broward Health General & Coral Springs',
    network: 'broward',
    size: 1378,
    location: 'Fort Lauderdale, FL',
    contactName: 'Alisa Bert',
    contactTitle: 'Senior VP and Chief Financial Officer',
    keyLeadership: {
      administrator: 'Jodi Pearl',
      itSecurity: 'James Orr',
      formerCio: 'Doris Peek'
    },
    status: 'Enterprise Opportunity',
    emramStage: 'Stage 4',
    riskScore: 'Critical (Third-party integrations)',
    dealStage: 'Zero-Trust Architecture Strategy Sessions',
    clinicalPriorities: 'EHR and PACS integration across public safety net, multi-factor authentication (MFA) at point-of-care, HIPAA audit preparedness.',
    notes: 'CFO Alisa Bert (formerly of HCA Aventura) holds strict financial ROI standards but is deeply concerned with security. Point-of-care carts represent vulnerable nodes. Security Officer James Orr is highly interested in Sophos, Palo Alto, and Armis integrations.',
    actionItems: [
      'Provide Broward-specific "Architect of Trust" brief showing cost savings of unified, hardware-locked endpoint security.',
      'Invite James Orr and team to the Axis Experience Center with partner representatives.',
      'Submit bids for next-term budget covering smart medication carts across all 4 county hospitals.'
    ]
  },
  {
    id: 'south-miami',
    name: 'South Miami Hospital',
    network: 'baptist',
    size: 467,
    location: 'Miami, FL',
    contactName: 'Mimi Taylor',
    contactTitle: 'VP of Information Technology',
    keyLeadership: {
      cno: 'Becky Montesino-King',
      pharmacyDirector: 'Connie Chan',
      accountRep: 'Angel Rios'
    },
    status: 'SLA Evaluation',
    emramStage: 'Stage 5',
    riskScore: 'Medium',
    dealStage: 'Fleet Analytics and Sitter Cost Reduction',
    clinicalPriorities: 'Alleviating nurse burnout, 1:1 sitter cost reduction, battery telemetry for fleet uptime.',
    notes: 'Angel Rios (formerly of UHealth) is driving digital transition. Mimi Taylor wants deep insight into the "true cost of care" and clinician burnout. Baptist is evaluating the Howard Care Pro for advanced fleet analytics—displaying real-time battery cell health and preventing dead carts from stalling clinical shifts.',
    actionItems: [
      'Demonstrate VitalChat integration on the Care Pro, showing how virtual sitting can reduce 1:1 staffing costs by up to 70%.',
      'Provide the customized "How Software Improves Workflow" telemetry brief for Baptist stakeholders.',
      'Finalize quote for the initial 20-cart pilot on the physical medicine floor.'
    ]
  }
];

// ==========================================
// NEW EXCEL ENGAGEMENT & REVENUE DATASETS
// ==========================================

const BrandRevenueData = [
  { brand: "Howard Technology Solutions", invoiced: 5313383, ctoAmount: 1323206, ctoPct: 24.9 },
  { brand: "Honeywell", invoiced: 1372244, ctoAmount: 173886, ctoPct: 12.67 },
  { brand: "Zebra Technologies", invoiced: 1345185, ctoAmount: 178708, ctoPct: 13.28 },
  { brand: "Dell", invoiced: 1234900, ctoAmount: 155882, ctoPct: 12.62 },
  { brand: "Code Corporation", invoiced: 112500, ctoAmount: 8347, ctoPct: 7.42 },
  { brand: "10ZiG", invoiced: 85200, ctoAmount: 4914, ctoPct: 5.77 },
  { brand: "Cybernet Manufacturing", invoiced: 95400, ctoAmount: 3997, ctoPct: 4.19 }
];

const LinecardChannelPipeline = [
  { letter: "F", name: "Physical & Electronic Security Solutions", items: "Access Control, Video Surveillance, Intercoms, Emergency Alert, Visitor Management", partner: "Sentinel Security", opps: 75, range: "$80,000 - $250,000", status: "Active" },
  { letter: "G", name: "Kiosk Solutions", items: "Indoor/Outdoor Kiosks, Large Format Displays, Content Management Software, Wayfinding", partner: "Kiosk Innovations", opps: 40, range: "$35,000 - $100,000", status: "Evaluation" },
  { letter: "H", name: "Patient Experience Solutions", items: "Interactive Solutions, Digital Signage, Nurse Call, Gaming Carts, Telehealth, Wayfinding", partner: "ComfortCare Tech", opps: 55, range: "$60,000 - $180,000", status: "Negotiation" },
  { letter: "I", name: "Professional Services", items: "Consulting (Network Assessments, Outsourced Labor), Installation, Managed Services, Human Cyber Training (KnowBe4)", partner: "HOWARD Services", opps: 15, range: "$10,000 - $50,000", status: "Pipeline" },
  { letter: "J", name: "Point-of-Care Solutions", items: "Point-of-Care Carts, Medication Dispense Carts, Barcode Scanners, Medical Grade LCDs, Washable Keyboard/Mouse", partner: "MedEquip Direct", opps: 25, range: "$20,000 - $70,000", status: "Bidding" },
];

const PartnerContacts = [
  { name: "Jennifer O'Leary", company: "HP / Poly", title: "Regional Channel Manager", phone: "(816) 812-5033", email: "jennifer.oleary@hp.com", scope: "AudioVisual, Teams Rooms, Clinical Poly Hubs" },
  { name: "Daniel Schattie", company: "HP / Poly (Jupiter)", title: "Healthcare Executive", phone: "(561) 329-2455", email: "daniel.schattie@hp.com", scope: "South Florida Healthcare Sourcing & Epic Hardware" },
  { name: "Patrick Pasterson", company: "Jabra", title: "Southeast Enterprise Lead", phone: "(510) 366-7134", email: "pmasterton@jabra.com", scope: "Bedside Audios, Noise-canceling micro-peripherals" },
  { name: "Bryan Rundell", company: "Armis", title: "Southeast Enterprise Healthcare Representative", phone: "954-649-6211", email: "Bryan.rundell@armis.com", scope: "Bedside Device Discovery & Zero-Trust Threat containment" },
  { name: "Satya Polisetti", company: "VitalChat", title: "Senior Director, Corp Dev", phone: "336-906-9920", email: "Satya.Polisetti@vitalchat.com", scope: "AI Fall Prevention & Virtual Nurse integrations" },
  { name: "Matthew Hurley", company: "ViewSonic", title: "Regional Sales Manager", phone: "716-243-6173", email: "Matt.hurley@viewsonic.com", scope: "Backlit Clinical Displays & Touch Command monitors" },
  { name: "Alexandra Gulledge", company: "Howard Technology Solutions", title: "South Florida Medical AE", phone: "728-209-5966", email: "AGulledge@Howard-Medical.com", scope: "Primary Regional Account Executive & SLA Structuring" }
];

// ==========================================
// OUTREACH TEMPLATE GENERATOR UTILS
// ==========================================
const getElevatorPitch = (role, partners) => {
  switch (role) {
    case 'CNO':
      return `"We’re here to solve the biggest crisis in clinical care right now: nurse burnout and staffing shortages. By integrating VitalChat’s hands-free AI virtual nursing directly into the Howard Care Pro medical carts, one remote nurse can monitor dozens of patient rooms, reducing 1:1 sitter costs by 70%. Combined with ViewSonic clinical displays, your team gets instant, crystal-clear patient rounding with zero additional clicks, and the entire bedside environment is continuously secured by Armis's silent Zero-Trust shield."`;
    case 'CIO':
      return `"We are helping systems transition from reactive cybersecurity to an active, self-shielding command center. Traditional medical carts are vulnerable endpoints. By wrapping the Howard Care Pro cart in Armis\'s bedside asset intelligence, we detect anomalies, score risk, and contain threats automatically. Through our vertical integration, you buy the cart, compute, and security as a single cohesive unit, eliminating vendor finger-pointing while supporting your journey to HIMSS Stage 6 and 7."`;
    case 'CFO':
      return `"Every device on your floor is a $10M breach risk and an operational bottleneck. Howard Medical offers unmatched Total Cost of Ownership through vertical integration. Since we manufacture the cart, the compute, and secure the power telemetry under one warranty, we reduce deployment friction by 30%. When paired with VitalChat\'s virtual patient monitoring, we help your hospital slash expensive 1:1 nursing assistant sitter costs while automating regulatory audit compliance."`;
    default:
      return '';
  }
};

// ==========================================
// MAIN COMPONENT
// ==========================================
export default function App() {
  const [activeTab, setActiveTab] = useState('dashboard');
  
  // CRM state
  const [searchQuery, setSearchQuery] = useState('');
  const [selectedNetwork, setSelectedNetwork] = useState('all');
  const [selectedAccount, setSelectedAccount] = useState(AccountsData[0]);

  // Partner Lab states
  const [revSortField, setRevSortField] = useState('invoiced');
  const [revSortOrder, setRevSortOrder] = useState('desc');
  const [contactSearch, setContactSearch] = useState('');

  // Simulator state
  const [simStep, setSimStep] = useState('idle'); // idle, attack, scanning, alerting, protected
  const [vitalsAlert, setVitalsAlert] = useState(false);
  const [phiLeakDetected, setPhiLeakDetected] = useState(false);
  const [logMessages, setLogMessages] = useState([]);

  // HIMSS Maturity Analyzer states
  const [activeMaturityStage, setActiveMaturityStage] = useState(6);
  const [extrinsicBurden, setExtrinsicBurden] = useState(70); // Slider: clicks/complexities
  
  // Pitch and Outreach states
  const [selectedPitchRole, setSelectedPitchRole] = useState('CNO');
  const [outreachContact, setOutreachContact] = useState('Billie Young');
  const [outreachHospital, setOutreachHospital] = useState('Good Samaritan Medical Center');
  const [outreachTopic, setOutreachTopic] = useState('implementing smart, Zero-Trust virtual care networks');
  const [copiedText, setCopiedText] = useState(false);

  // Initialize logs on simulator run
  useEffect(() => {
    if (simStep === 'idle') {
      setLogMessages(['[SYSTEM] Bedside Command Center initialized.', '[INFRASTRUCTURE] Howard Care Pro cart connected. Status: Secure.', '[PARTNER] VitalChat AI active - monitoring patient room 412.', '[PARTNER] Armis Device Security shield: On. Risk score: Low (12/100).']);
    }
  }, [simStep]);

  // Custom clipboard copy
  const handleCopy = (text) => {
    const tempInput = document.createElement('textarea');
    tempInput.value = text;
    document.body.appendChild(tempInput);
    tempInput.select();
    try {
      document.execCommand('copy');
      setCopiedText(true);
      setTimeout(() => setCopiedText(false), 2000);
    } catch (err) {
      console.error('Failed to copy text', err);
    }
    document.body.removeChild(tempInput);
  };

  // Filter accounts
  const filteredAccounts = useMemo(() => {
    return AccountsData.filter(acc => {
      const matchSearch = acc.name.toLowerCase().includes(searchQuery.toLowerCase()) || 
                          acc.contactName.toLowerCase().includes(searchQuery.toLowerCase()) ||
                          acc.location.toLowerCase().includes(searchQuery.toLowerCase());
      const matchNetwork = selectedNetwork === 'all' || acc.network === selectedNetwork;
      return matchSearch && matchNetwork;
    });
  }, [searchQuery, selectedNetwork]);

  // Sort and filter partner revenue metrics
  const sortedRevenue = useMemo(() => {
    return [...BrandRevenueData].sort((a, b) => {
      let valA = a[revSortField];
      let valB = b[revSortField];
      if (revSortOrder === 'desc') {
        return valB - valA;
      }
      return valA - valB;
    });
  }, [revSortField, revSortOrder]);

  // Filter contact list
  const filteredContacts = useMemo(() => {
    return PartnerContacts.filter(c => 
      c.name.toLowerCase().includes(contactSearch.toLowerCase()) ||
      c.company.toLowerCase().includes(contactSearch.toLowerCase()) ||
      c.scope.toLowerCase().includes(contactSearch.toLowerCase())
    );
  }, [contactSearch]);

  const toggleSort = (field) => {
    if (revSortField === field) {
      setRevSortOrder(prev => prev === 'asc' ? 'desc' : 'asc');
    } else {
      setRevSortField(field);
      setRevSortOrder('desc');
    }
  };

  // Trigger simulated threat workflow
  const runSimulator = () => {
    setSimStep('attack');
    setLogMessages(prev => [...prev, '[THREAT ALERT] Unregistered IoMT pulse oximeter plugged into Cart USB.', '[THREAT ALERT] Suspicious telemetry detected. Device initiating data dump targeting PHI servers.']);
    
    // Step 2: Armis Scanning
    setTimeout(() => {
      setSimStep('scanning');
      setLogMessages(prev => [...prev, '[SECURITY - ARMIS] Scanning endpoint ID: USBCart-412-PulseOx.', '[SECURITY - ARMIS] Behavior analysis: Outbound traffic matches known Ransomware footprint.', '[SECURITY - ARMIS] Risk Assessment spiked: Critical Risk (96/100).']);
    }, 2000);

    // Step 3: Isolating & Alerting
    setTimeout(() => {
      setSimStep('alerting');
      setPhiLeakDetected(true);
      setVitalsAlert(true);
      setLogMessages(prev => [...prev, '[PROTECTION ACTIVE] Armis triggers Zero-Trust device isolation block.', '[PROTECTION ACTIVE] Isolate packet sent to switch port 14.', '[VITALCHAT] Sitter Alert: Bedside camera detects patient fall-risk hazard during network spike.']);
    }, 4500);

    // Step 4: Shield Protected
    setTimeout(() => {
      setSimStep('protected');
      setPhiLeakDetected(false);
      setVitalsAlert(false);
      setLogMessages(prev => [...prev, '[SHIELD SUCCESS] Incident neutralized in 4.2 seconds.', '[SHIELD SUCCESS] Zero PHI leaked. Bedside video feed encrypted & uninterrupted.', '[SYSTEM] Howard Care Pro cart restored to baseline network operation.']);
    }, 7500);
  };

  const resetSimulator = () => {
    setSimStep('idle');
    setPhiLeakDetected(false);
    setVitalsAlert(false);
  };

  // Compute calculated metrics based on burden slider
  const nurseBurnoutIndex = Math.round((extrinsicBurden * 1.2));
  const timeSavedPerShift = Math.round((100 - extrinsicBurden) * 0.45);

  return (
    <div className="min-h-screen bg-slate-950 text-slate-100 flex flex-col font-sans selection:bg-cyan-500 selection:text-slate-900">
      
      {/* ==========================================
          PREMIUM HEADER
         ========================================== */}
      <header className="border-b border-slate-800 bg-slate-900/60 backdrop-blur-md sticky top-0 z-50">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 h-20 flex items-center justify-between">
          <div className="flex items-center gap-3">
            <div className="h-11 w-11 rounded-xl bg-gradient-to-tr from-cyan-500 to-indigo-600 flex items-center justify-center shadow-lg shadow-cyan-500/20">
              <Shield className="h-6 w-6 text-slate-950 stroke-[2.5]" />
            </div>
            <div>
              <span className="text-xs uppercase tracking-widest text-cyan-400 font-bold block">Ecosystem Command Suite</span>
              <h1 className="text-xl font-bold tracking-tight text-white flex items-center gap-2">
                Howard Medical <span className="text-xs py-0.5 px-2 rounded-full bg-slate-800 border border-slate-700 font-mono text-slate-400">v2.5-Flash</span>
              </h1>
            </div>
          </div>

          {/* Navigation */}
          <nav className="hidden md:flex items-center gap-1 bg-slate-950 border border-slate-800 p-1.5 rounded-xl">
            <button 
              onClick={() => setActiveTab('dashboard')}
              className={`px-4 py-2 text-xs font-semibold rounded-lg tracking-wide transition-all duration-200 ${activeTab === 'dashboard' ? 'bg-cyan-500 text-slate-950 shadow-md' : 'text-slate-400 hover:text-slate-200'}`}
            >
              <Activity className="h-3.5 w-3.5 inline mr-1.5" /> Dashboard
            </button>
            <button 
              onClick={() => setActiveTab('crm')}
              className={`px-4 py-2 text-xs font-semibold rounded-lg tracking-wide transition-all duration-200 ${activeTab === 'crm' ? 'bg-cyan-500 text-slate-950 shadow-md' : 'text-slate-400 hover:text-slate-200'}`}
            >
              <Users className="h-3.5 w-3.5 inline mr-1.5" /> CRM Deep Dive
            </button>
            <button 
              onClick={() => setActiveTab('partners')}
              className={`px-4 py-2 text-xs font-semibold rounded-lg tracking-wide transition-all duration-200 ${activeTab === 'partners' ? 'bg-cyan-500 text-slate-950 shadow-md' : 'text-slate-400 hover:text-slate-200'}`}
            >
              <Cpu className="h-3.5 w-3.5 inline mr-1.5" /> Partner Lab
            </button>
            <button 
              onClick={() => setActiveTab('himss')}
              className={`px-4 py-2 text-xs font-semibold rounded-lg tracking-wide transition-all duration-200 ${activeTab === 'himss' ? 'bg-cyan-500 text-slate-950 shadow-md' : 'text-slate-400 hover:text-slate-200'}`}
            >
              <Layers className="h-3.5 w-3.5 inline mr-1.5" /> Maturity Frameworks
            </button>
            <button 
              onClick={() => setActiveTab('summit')}
              className={`px-4 py-2 text-xs font-semibold rounded-lg tracking-wide transition-all duration-200 ${activeTab === 'summit' ? 'bg-cyan-500 text-slate-950 shadow-md' : 'text-slate-400 hover:text-slate-200'}`}
            >
              <Calendar className="h-3.5 w-3.5 inline mr-1.5" /> Summit Outreach
            </button>
          </nav>

          {/* Quick Stats Badge */}
          <div className="flex items-center gap-3">
            <div className="hidden lg:flex flex-col text-right">
              <span className="text-[10px] text-slate-400 font-mono">Bedside Command Node</span>
              <span className="text-xs font-semibold text-emerald-400 flex items-center gap-1.5 justify-end">
                <span className="h-2 w-2 rounded-full bg-emerald-400 animate-pulse" /> Active Shielding
              </span>
            </div>
          </div>
        </div>
      </header>

      {/* Mobile Nav Bar */}
      <div className="md:hidden flex overflow-x-auto bg-slate-900 border-b border-slate-800 p-2 gap-1 sticky top-20 z-40">
        <button 
          onClick={() => setActiveTab('dashboard')}
          className={`flex-shrink-0 px-3 py-1.5 text-xs font-medium rounded-lg transition-all ${activeTab === 'dashboard' ? 'bg-cyan-500 text-slate-950' : 'text-slate-400'}`}
        >
          Dashboard
        </button>
        <button 
          onClick={() => setActiveTab('crm')}
          className={`flex-shrink-0 px-3 py-1.5 text-xs font-medium rounded-lg transition-all ${activeTab === 'crm' ? 'bg-cyan-500 text-slate-950' : 'text-slate-400'}`}
        >
          CRM Tracker
        </button>
        <button 
          onClick={() => setActiveTab('partners')}
          className={`flex-shrink-0 px-3 py-1.5 text-xs font-medium rounded-lg transition-all ${activeTab === 'partners' ? 'bg-cyan-500 text-slate-950' : 'text-slate-400'}`}
        >
          Partner Lab
        </button>
        <button 
          onClick={() => setActiveTab('himss')}
          className={`flex-shrink-0 px-3 py-1.5 text-xs font-medium rounded-lg transition-all ${activeTab === 'himss' ? 'bg-cyan-500 text-slate-950' : 'text-slate-400'}`}
        >
          EMRAM & Clicks
        </button>
        <button 
          onClick={() => setActiveTab('summit')}
          className={`flex-shrink-0 px-3 py-1.5 text-xs font-medium rounded-lg transition-all ${activeTab === 'summit' ? 'bg-cyan-500 text-slate-950' : 'text-slate-400'}`}
        >
          Summit Planner
        </button>
      </div>

      {/* ==========================================
          MAIN AREA CONTAINERS
         ========================================== */}
      <main className="flex-1 max-w-7xl w-full mx-auto px-4 sm:px-6 lg:px-8 py-8">
        
        {/* ==========================================
            TAB 1: STRATEGIC DASHBOARD & SIMULATOR
           ========================================== */}
        {activeTab === 'dashboard' && (
          <div className="space-y-8 animate-fadeIn">
            {/* Intro Hero Section */}
            <div className="p-6 md:p-8 rounded-3xl bg-gradient-to-r from-slate-900 via-slate-900 to-indigo-950 border border-slate-800 shadow-2xl relative overflow-hidden">
              <div className="absolute right-0 top-0 h-full w-1/3 opacity-10 bg-[radial-gradient(circle_at_top_right,rgba(6,182,212,1),transparent)] pointer-events-none" />
              <div className="max-w-3xl">
                <span className="text-xs uppercase font-extrabold tracking-widest text-cyan-400 px-3 py-1 rounded-full bg-cyan-950/50 border border-cyan-800/50 inline-block mb-4">
                  The Howard Advantage
                </span>
                <h2 className="text-3xl font-extrabold text-white tracking-tight sm:text-4xl">
                  Redefining Point-of-Care Technology
                </h2>
                <p className="mt-4 text-base text-slate-300 leading-relaxed">
                  Howard Medical operates at the intersection of robust healthcare hardware, emerging technology, and strategic clinical partnerships. By delivering a cohesive clinical ecosystem—combining our <strong className="text-cyan-300">Workstations on Wheels</strong>, integrated computing, and partner solutions from <strong className="text-white">VitalChat, ViewSonic, and Armis</strong>—we resolve clinician burnout, eliminate security silos, and streamline the path to HIMSS Stage 7.
                </p>
              </div>
            </div>

            {/* Micro Metrics Rows */}
            <div className="grid grid-cols-1 gap-5 sm:grid-cols-2 lg:grid-cols-4">
              <div className="bg-slate-900 p-5 rounded-2xl border border-slate-800 flex items-center justify-between shadow-lg">
                <div>
                  <p className="text-xs text-slate-400 font-mono">Global Footprint</p>
                  <h3 className="text-2xl font-bold mt-1 text-white">3,700+</h3>
                  <p className="text-[10px] text-emerald-400 mt-1">Hospitals Active Worldwide</p>
                </div>
                <div className="p-3 bg-slate-950 border border-slate-800 rounded-xl text-cyan-400">
                  <MapPin className="h-5 w-5" />
                </div>
              </div>

              <div className="bg-slate-900 p-5 rounded-2xl border border-slate-800 flex items-center justify-between shadow-lg">
                <div>
                  <p className="text-xs text-slate-400 font-mono">Bedside Integrations</p>
                  <h3 className="text-2xl font-bold mt-1 text-white">4 Brands</h3>
                  <p className="text-[10px] text-cyan-400 mt-1">Unified Command Ecosystem</p>
                </div>
                <div className="p-3 bg-slate-950 border border-slate-800 rounded-xl text-cyan-400">
                  <Layers className="h-5 w-5" />
                </div>
              </div>

              <div className="bg-slate-900 p-5 rounded-2xl border border-slate-800 flex items-center justify-between shadow-lg">
                <div>
                  <p className="text-xs text-slate-400 font-mono">Deployment Friction</p>
                  <h3 className="text-2xl font-bold mt-1 text-emerald-400">-30%</h3>
                  <p className="text-[10px] text-slate-400 mt-1">Single-Source Integration</p>
                </div>
                <div className="p-3 bg-slate-950 border border-slate-800 rounded-xl text-emerald-400">
                  <TrendingUp className="h-5 w-5" />
                </div>
              </div>

              <div className="bg-slate-900 p-5 rounded-2xl border border-slate-800 flex items-center justify-between shadow-lg">
                <div>
                  <p className="text-xs text-slate-400 font-mono">Sitter Staffing Cost</p>
                  <h3 className="text-2xl font-bold mt-1 text-emerald-400">-70%</h3>
                  <p className="text-[10px] text-slate-400 mt-1">Via VitalChat AI Cameras</p>
                </div>
                <div className="p-3 bg-slate-950 border border-slate-800 rounded-xl text-emerald-400">
                  <Video className="h-5 w-5" />
                </div>
              </div>
            </div>

            {/* SIMULATOR AND HIGH-LEVEL ACTIONS */}
            <div className="grid grid-cols-1 lg:grid-cols-12 gap-8">
              
              {/* Proactive AI Bedside Security Simulator */}
              <div className="lg:col-span-8 bg-slate-900 border border-slate-800 rounded-3xl p-6 shadow-2xl relative">
                <div className="flex items-center justify-between mb-6 pb-4 border-b border-slate-800">
                  <div className="flex items-center gap-2">
                    <Shield className="h-5 w-5 text-cyan-400" />
                    <div>
                      <h3 className="font-bold text-lg text-white">Proactive Bedside Defense Simulator</h3>
                      <p className="text-xs text-slate-400">Real-time threat containment at the clinical workstation</p>
                    </div>
                  </div>
                  <span className="text-[10px] bg-slate-950 font-mono px-2 py-1 border border-slate-800 rounded text-slate-400">
                    Location: Room 412
                  </span>
                </div>

                <div className="grid grid-cols-1 md:grid-cols-12 gap-6">
                  
                  {/* Left panel: Simulated Cart & Indicators */}
                  <div className="md:col-span-5 flex flex-col justify-between bg-slate-950 border border-slate-800 rounded-2xl p-5 relative overflow-hidden">
                    <div className="absolute top-0 right-0 h-24 w-24 bg-cyan-500/5 blur-3xl pointer-events-none" />
                    
                    {/* The Cart Representation */}
                    <div className="flex flex-col items-center py-4">
                      <div className="relative">
                        {/* Monitor Frame */}
                        <div className={`h-24 w-36 border-4 rounded-xl flex flex-col items-center justify-center relative transition-all duration-300 ${
                          simStep === 'protected' ? 'border-emerald-500 bg-emerald-950/20' :
                          simStep === 'alerting' ? 'border-rose-500 bg-rose-950/20' :
                          simStep === 'scanning' ? 'border-cyan-500 bg-cyan-950/20' :
                          simStep === 'attack' ? 'border-orange-500 bg-orange-950/20' :
                          'border-slate-700 bg-slate-900'
                        }`}>
                          <Laptop className="h-10 w-10 text-slate-400" />
                          <span className="text-[9px] font-mono mt-1 text-slate-300 uppercase tracking-wider">Howard Care Pro</span>
                          
                          {/* Inside Screen State */}
                          <div className="absolute bottom-1 right-2 left-2 flex items-center justify-between">
                            <span className="h-1.5 w-1.5 rounded-full bg-emerald-400" />
                            <span className="text-[8px] font-mono text-slate-400">Battery: 94%</span>
                          </div>

                          {/* Security Alert Icon overlay */}
                          {simStep === 'alerting' && (
                            <div className="absolute inset-0 bg-rose-950/80 rounded-lg flex flex-col items-center justify-center text-rose-400 animate-pulse p-1 text-center">
                              <AlertTriangle className="h-5 w-5" />
                              <span className="text-[8px] uppercase tracking-wider font-extrabold">Malignant Threat Blocked</span>
                            </div>
                          )}

                          {simStep === 'protected' && (
                            <div className="absolute inset-0 bg-emerald-950/80 rounded-lg flex flex-col items-center justify-center text-emerald-400 p-1 text-center">
                              <CheckCircle className="h-5 w-5" />
                              <span className="text-[8px] uppercase tracking-wider font-extrabold">Ecosystem Isolated</span>
                            </div>
                          )}
                        </div>

                        {/* Cart Handle Bar */}
                        <div className="w-24 h-2 bg-slate-700 mx-auto rounded-full mt-1.5" />
                        {/* Main Pillar */}
                        <div className="w-4 h-16 bg-slate-800 mx-auto" />
                        {/* Base Unit with casters */}
                        <div className="w-28 h-8 bg-slate-800 mx-auto rounded-t-xl relative">
                          <span className="absolute -bottom-2 left-2 h-4 w-4 bg-slate-700 border border-slate-600 rounded-full flex items-center justify-center text-[6px] text-cyan-400 font-extrabold">S</span>
                          <span className="absolute -bottom-2 right-2 h-4 w-4 bg-slate-700 border border-slate-600 rounded-full flex items-center justify-center text-[6px] text-cyan-400 font-extrabold">S</span>
                        </div>
                      </div>
                    </div>

                    {/* Network & Physical Status indicators */}
                    <div className="space-y-2 mt-4 pt-3 border-t border-slate-900 text-xs">
                      <div className="flex justify-between items-center">
                        <span className="text-slate-400 font-mono text-[10px]">Bedside Camera:</span>
                        <span className={`font-semibold ${vitalsAlert ? 'text-amber-400' : 'text-emerald-400'}`}>
                          {vitalsAlert ? 'AI Fall Monitor Active' : 'Patient Safe'}
                        </span>
                      </div>
                      <div className="flex justify-between items-center">
                        <span className="text-slate-400 font-mono text-[10px]">PHI Protection:</span>
                        <span className={`font-semibold ${phiLeakDetected ? 'text-rose-400 animate-pulse' : 'text-emerald-400'}`}>
                          {phiLeakDetected ? 'VULNERABILITY DETECTED' : 'Safe / Non-Leaking'}
                        </span>
                      </div>
                      <div className="flex justify-between items-center">
                        <span className="text-slate-400 font-mono text-[10px]">Armis Security Shield:</span>
                        <span className={`text-[10px] uppercase font-bold py-0.5 px-2 rounded-full ${
                          simStep === 'idle' ? 'bg-slate-900 text-slate-400' :
                          simStep === 'attack' ? 'bg-orange-950 text-orange-400' :
                          simStep === 'scanning' ? 'bg-cyan-950 text-cyan-400' :
                          simStep === 'alerting' ? 'bg-rose-950 text-rose-400 animate-pulse' :
                          'bg-emerald-950 text-emerald-400'
                        }`}>
                          {simStep === 'idle' && 'Shield Ready'}
                          {simStep === 'attack' && 'Analyzing Packet'}
                          {simStep === 'scanning' && 'Scanning Risk'}
                          {simStep === 'alerting' && 'Threat Isolated'}
                          {simStep === 'protected' && 'Zero-Trust Secure'}
                        </span>
                      </div>
                    </div>
                  </div>

                  {/* Right panel: Active Logger & controls */}
                  <div className="md:col-span-7 flex flex-col justify-between">
                    <div className="bg-slate-950 rounded-2xl border border-slate-800 p-4 h-56 flex flex-col justify-between">
                      <div className="text-xs font-mono text-cyan-400 border-b border-slate-900 pb-1.5 flex justify-between items-center">
                        <span>COMMAND MONITOR FEED</span>
                        <span className="h-1.5 w-1.5 rounded-full bg-cyan-400 animate-ping" />
                      </div>
                      <div className="flex-1 overflow-y-auto font-mono text-[11px] text-slate-300 space-y-1.5 my-2 pr-1 scrollbar">
                        {logMessages.map((msg, idx) => (
                          <div key={idx} className={
                            msg.includes('[THREAT ALERT]') ? 'text-rose-400' : 
                            msg.includes('[PROTECTION') || msg.includes('[SHIELD') ? 'text-emerald-400 font-semibold' : 
                            msg.includes('[SECURITY') ? 'text-cyan-400' : 'text-slate-400'
                          }>
                            {msg}
                          </div>
                        ))}
                      </div>
                      <div className="text-[10px] text-slate-500 font-mono flex items-center justify-between">
                        <span>Incident Latency: <strong className="text-white">0.02ms</strong></span>
                        <span>Threat Mitigation Time: <strong className="text-white">4.2s</strong></span>
                      </div>
                    </div>

                    {/* Simulator Action Controls */}
                    <div className="mt-4 flex gap-3">
                      {simStep === 'idle' ? (
                        <button 
                          onClick={runSimulator}
                          className="flex-1 py-3 px-4 rounded-xl text-xs font-bold text-slate-950 bg-gradient-to-r from-cyan-400 to-indigo-500 hover:from-cyan-300 hover:to-indigo-400 transition-all shadow-lg shadow-cyan-500/20 flex items-center justify-center gap-1.5"
                        >
                          <AlertTriangle className="h-4 w-4" /> Trigger Bedside Threat
                        </button>
                      ) : (
                        <button 
                          onClick={resetSimulator}
                          disabled={simStep !== 'protected'}
                          className={`flex-1 py-3 px-4 rounded-xl text-xs font-bold transition-all flex items-center justify-center gap-1.5 ${
                            simStep === 'protected' 
                              ? 'bg-slate-800 hover:bg-slate-700 text-white' 
                              : 'bg-slate-900 text-slate-600 cursor-not-allowed'
                          }`}
                        >
                          Reset Command Center
                        </button>
                      )}
                    </div>
                  </div>
                </div>
              </div>

              {/* High-Level South Florida Event Strategy */}
              <div className="lg:col-span-4 space-y-6">
                <div className="bg-slate-900 border border-slate-800 rounded-3xl p-6 shadow-xl">
                  <h3 className="font-bold text-lg text-white mb-2 flex items-center gap-2">
                    <Calendar className="h-5 w-5 text-indigo-400" />
                    FL Innovation Summit
                  </h3>
                  <p className="text-xs text-slate-400 leading-relaxed mb-4">
                    The Florida Healthcare Innovation Summit 2026 is our high-yield networking target in Miami on <strong>Thursday, April 30, 2026</strong>.
                  </p>
                  
                  <div className="space-y-3.5 text-xs">
                    <div className="p-3 bg-slate-950 rounded-xl border border-slate-800 flex items-start gap-2.5">
                      <MapPin className="h-4 w-4 text-rose-400 mt-0.5" />
                      <div>
                        <strong className="text-slate-200">Kimpton EPIC Hotel</strong>
                        <p className="text-[11px] text-slate-400">14th Floor - Metropolis Ballroom</p>
                      </div>
                    </div>

                    <div className="p-3 bg-slate-950 rounded-xl border border-slate-800 flex items-start gap-2.5">
                      <Layers className="h-4 w-4 text-indigo-400 mt-0.5" />
                      <div>
                        <strong className="text-slate-200">Howard Booth Size</strong>
                        <p className="text-[11px] text-slate-400">10&apos; x 6.5&apos; - Secure Bedside Command demo space</p>
                      </div>
                    </div>

                    <div className="p-3 bg-slate-950 rounded-xl border border-slate-800 flex items-start gap-2.5">
                      <Users className="h-4 w-4 text-cyan-400 mt-0.5" />
                      <div>
                        <strong className="text-slate-200">Ecosystem Partners On-Site</strong>
                        <p className="text-[11px] text-slate-400">VitalChat, Armis, ViewSonic, Howard</p>
                      </div>
                    </div>
                  </div>

                  <button 
                    onClick={() => setActiveTab('summit')}
                    className="w-full mt-5 py-2.5 px-4 bg-indigo-600/30 hover:bg-indigo-600/50 border border-indigo-500 text-indigo-200 text-xs font-semibold rounded-xl transition-all flex items-center justify-center gap-1.5"
                  >
                    Open Summit Strategy Playbook <ChevronRight className="h-3.5 w-3.5" />
                  </button>
                </div>
              </div>

            </div>
          </div>
        )}

        {/* ==========================================
            TAB 2: CRM & CLIENTS DEEP DIVE
           ========================================== */}
        {activeTab === 'crm' && (
          <div className="space-y-8 animate-fadeIn">
            {/* Control bar */}
            <div className="flex flex-col sm:flex-row gap-4 items-center justify-between bg-slate-900 p-4 rounded-2xl border border-slate-800 shadow-md">
              <div className="relative w-full sm:w-80">
                <Search className="absolute left-3.5 top-3 h-4 w-4 text-slate-500" />
                <input 
                  type="text" 
                  placeholder="Search accounts, locations, contacts..." 
                  value={searchQuery}
                  onChange={(e) => setSearchQuery(e.target.value)}
                  className="w-full pl-10 pr-4 py-2 text-sm bg-slate-950 border border-slate-800 rounded-xl focus:outline-none focus:border-cyan-500 text-slate-200 placeholder-slate-500"
                />
              </div>

              <div className="flex items-center gap-2 w-full sm:w-auto">
                <span className="text-xs text-slate-400 font-mono whitespace-nowrap">Filter Network:</span>
                <select 
                  value={selectedNetwork} 
                  onChange={(e) => setSelectedNetwork(e.target.value)}
                  className="w-full sm:w-48 py-2 px-3 text-xs bg-slate-950 border border-slate-800 rounded-xl text-slate-300 focus:outline-none focus:border-cyan-500"
                >
                  <option value="all">All Regional Networks</option>
                  <option value="va-visn8">VISN 8 (Veterans Affairs)</option>
                  <option value="baptist">Baptist Health S. Florida</option>
                  <option value="jackson">Jackson Health / UHealth</option>
                  <option value="tenet">Tenet / Palm Beach Network</option>
                  <option value="broward">Broward Health</option>
                </select>
              </div>
            </div>

            <div className="grid grid-cols-1 lg:grid-cols-12 gap-8">
              {/* Accounts List (Left Column) */}
              <div className="lg:col-span-5 space-y-3 max-h-[600px] overflow-y-auto pr-2 scrollbar">
                {filteredAccounts.length === 0 ? (
                  <div className="text-center py-12 text-slate-500 text-sm bg-slate-900 rounded-2xl border border-slate-850">
                    No matching accounts found.
                  </div>
                ) : (
                  filteredAccounts.map((acc) => {
                    const matchedNetwork = HealthNetworks.find(n => n.id === acc.network);
                    return (
                      <div 
                        key={acc.id}
                        onClick={() => setSelectedAccount(acc)}
                        className={`p-4 rounded-xl border transition-all duration-200 cursor-pointer text-left ${
                          selectedAccount.id === acc.id 
                            ? 'bg-slate-900 border-cyan-500 shadow-md shadow-cyan-500/5' 
                            : 'bg-slate-900/40 border-slate-800 hover:border-slate-700 hover:bg-slate-900/60'
                        }`}
                      >
                        <div className="flex justify-between items-start gap-2">
                          <h4 className="font-bold text-sm text-white">{acc.name}</h4>
                          <span className="text-[10px] bg-slate-950 border border-slate-800 px-2 py-0.5 rounded font-mono text-slate-400">
                            {acc.size} Beds
                          </span>
                        </div>
                        <p className="text-xs text-slate-400 mt-1">{acc.location}</p>
                        
                        <div className="mt-3 flex items-center justify-between gap-2 border-t border-slate-800/40 pt-2 text-[11px]">
                          <span className="text-slate-500 font-mono">{acc.contactName}</span>
                          <span className={`px-2 py-0.5 rounded-full font-bold ${
                            acc.status.includes('High') || acc.status.includes('Hot')
                              ? 'bg-orange-950 text-orange-400' 
                              : 'bg-indigo-950 text-indigo-400'
                          }`}>
                            {acc.status}
                          </span>
                        </div>
                      </div>
                    );
                  })
                )}
              </div>

              {/* Selected Account Deep Dive (Right Column) */}
              <div className="lg:col-span-7 bg-slate-900 border border-slate-800 rounded-3xl p-6 shadow-2xl space-y-6 text-left">
                <div className="pb-4 border-b border-slate-800 flex flex-col sm:flex-row sm:items-center justify-between gap-3">
                  <div>
                    <span className="text-[10px] text-cyan-400 font-mono tracking-wider uppercase block">Regional Alignment Deep Dive</span>
                    <h3 className="text-xl font-black text-white">{selectedAccount.name}</h3>
                    <p className="text-xs text-slate-400 mt-0.5">{selectedAccount.location} • {selectedAccount.size} Beds</p>
                  </div>
                  <span className="self-start sm:self-auto text-xs py-1 px-3 rounded-full bg-slate-950 border border-slate-800 text-slate-300 font-mono">
                    HIMSS Maturity: <strong className="text-cyan-400">{selectedAccount.emramStage}</strong>
                  </span>
                </div>

                {/* Strategic Briefing Grid */}
                <div className="grid grid-cols-1 md:grid-cols-2 gap-4 text-xs">
                  <div className="p-3 bg-slate-950 rounded-xl border border-slate-800 space-y-1">
                    <span className="text-[10px] text-slate-500 uppercase tracking-wider block font-mono">Operational Pivot Contact</span>
                    <strong className="text-slate-200 text-sm block">{selectedAccount.contactName}</strong>
                    <span className="text-slate-400 block">{selectedAccount.contactTitle}</span>
                  </div>

                  <div className="p-3 bg-slate-950 rounded-xl border border-slate-800 space-y-1">
                    <span className="text-[10px] text-slate-500 uppercase tracking-wider block font-mono">Target Deal Stage</span>
                    <strong className="text-cyan-400 text-sm block">{selectedAccount.dealStage}</strong>
                    <span className="text-rose-400 block font-semibold">Asset Risk: {selectedAccount.riskScore}</span>
                  </div>
                </div>

                {/* Key Leadership Matrix */}
                <div className="p-4 bg-slate-950/60 rounded-xl border border-slate-800 text-xs space-y-2">
                  <span className="text-[10px] text-slate-500 uppercase tracking-wider block font-mono">Regional Stakeholders & Influencers</span>
                  <div className="grid grid-cols-1 sm:grid-cols-3 gap-3">
                    {Object.entries(selectedAccount.keyLeadership).map(([key, val]) => (
                      <div key={key} className="border-l-2 border-cyan-500 pl-2">
                        <span className="text-[10px] text-slate-400 capitalize block">{key.replace(/([A-Z])/g, ' $1')}</span>
                        <strong className="text-slate-200">{val}</strong>
                      </div>
                    ))}
                  </div>
                </div>

                {/* Strategic Notes & Clinical Priorities */}
                <div className="space-y-3.5 text-xs text-slate-300">
                  <div className="p-4 bg-indigo-950/20 border border-indigo-900/40 rounded-xl">
                    <strong className="text-indigo-200 block mb-1">Clinical Priorities</strong>
                    <p className="leading-relaxed">{selectedAccount.clinicalPriorities}</p>
                  </div>

                  <div>
                    <strong className="text-slate-200 block mb-1">Background Context</strong>
                    <p className="leading-relaxed text-slate-400">{selectedAccount.notes}</p>
                  </div>
                </div>

                {/* Core Strategic Actions Checklist */}
                <div className="space-y-2 pt-4 border-t border-slate-800 text-xs">
                  <span className="text-[10px] text-slate-500 uppercase tracking-wider block font-mono">Howard Strategic Actions</span>
                  <div className="space-y-2">
                    {selectedAccount.actionItems.map((item, index) => (
                      <div key={index} className="flex items-start gap-2.5">
                        <CheckCircle className="h-4 w-4 text-emerald-400 mt-0.5 flex-shrink-0" />
                        <span className="text-slate-300 leading-relaxed">{item}</span>
                      </div>
                    ))}
                  </div>
                </div>

              </div>
            </div>
          </div>
        )}

        {/* ==========================================
            TAB 3: THE PARTNER REVENUE & ENGAGEMENT LAB
           ========================================== */}
        {activeTab === 'partners' && (
          <div className="space-y-8 animate-fadeIn">
            {/* Partnership Header */}
            <div className="text-center max-w-3xl mx-auto space-y-3">
              <span className="text-xs uppercase font-extrabold tracking-widest text-cyan-400 px-3 py-1 rounded-full bg-cyan-950/50 border border-cyan-800/50 inline-block">
                Ecosystem Metrics & Channel Pipeline
              </span>
              <h2 className="text-3xl font-black text-white tracking-tight">Partner Revenue & Performance Lab</h2>
              <p className="text-slate-400 text-sm leading-relaxed">
                Directly synchronized with the active **YTD Partner Sourcing Database**. Track invoiced amounts, contribution to overhead (CTO), linecard pipelines, and quickly locate key regional partner representatives.
              </p>
            </div>

            {/* Financial Leaderboard Block */}
            <div className="grid grid-cols-1 lg:grid-cols-12 gap-8">
              
              {/* Leaderboard Table (Left side - 7 cols) */}
              <div className="lg:col-span-7 bg-slate-900 border border-slate-800 rounded-3xl p-5 shadow-lg space-y-4">
                <div className="flex justify-between items-center pb-2 border-b border-slate-800">
                  <h3 className="font-extrabold text-sm text-slate-300 uppercase tracking-wider flex items-center gap-2">
                    <DollarSign className="h-4 w-4 text-emerald-400" />
                    YTD Brand Revenue & CTO Sourcing
                  </h3>
                  <span className="text-[10px] text-slate-500 font-mono">Click columns to toggle sort order</span>
                </div>

                <div className="overflow-x-auto">
                  <table className="w-full text-left text-xs border-collapse">
                    <thead>
                      <tr className="border-b border-slate-800 text-slate-400 font-mono text-[10px] uppercase">
                        <th className="py-2.5 pr-2">Brand / Partner</th>
                        <th className="py-2.5 px-2 cursor-pointer hover:text-white" onClick={() => toggleSort('invoiced')}>
                          YTD Invoiced <ArrowUpDown className="h-3 w-3 inline ml-1 text-slate-600" />
                        </th>
                        <th className="py-2.5 px-2 cursor-pointer hover:text-white" onClick={() => toggleSort('ctoAmount')}>
                          YTD CTO ($) <ArrowUpDown className="h-3 w-3 inline ml-1 text-slate-600" />
                        </th>
                        <th className="py-2.5 pl-2 cursor-pointer hover:text-white text-right" onClick={() => toggleSort('ctoPct')}>
                          CTO % <ArrowUpDown className="h-3 w-3 inline ml-1 text-slate-600" />
                        </th>
                      </tr>
                    </thead>
                    <tbody className="divide-y divide-slate-850">
                      {sortedRevenue.map((row, idx) => (
                        <tr key={row.brand} className="hover:bg-slate-950/40 transition-colors">
                          <td className="py-3 pr-2 font-bold text-slate-200 flex items-center gap-2">
                            <span className="text-slate-500 text-[10px] font-mono">{idx + 1}.</span>
                            {row.brand}
                          </td>
                          <td className="py-3 px-2 font-mono text-slate-300">
                            ${row.invoiced.toLocaleString()}
                          </td>
                          <td className="py-3 px-2 font-mono text-emerald-400">
                            ${row.ctoAmount.toLocaleString()}
                          </td>
                          <td className="py-3 pl-2 font-mono text-right">
                            <div className="flex items-center justify-end gap-2">
                              <span className="font-bold text-cyan-400">{row.ctoPct}%</span>
                              <div className="w-12 bg-slate-950 h-1.5 rounded-full overflow-hidden border border-slate-800 hidden sm:block">
                                <div 
                                  className="bg-cyan-500 h-full rounded-full" 
                                  style={{ width: `${Math.min(row.ctoPct * 3, 100)}%` }} 
                                />
                              </div>
                            </div>
                          </td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                </div>

                <div className="p-3 bg-slate-950 rounded-xl border border-slate-850 text-[11px] text-slate-400 space-y-1">
                  <span className="text-[10px] text-emerald-400 font-bold uppercase block">Key Sourcing Insight:</span>
                  <p className="leading-relaxed">
                    Howard manufactured Technology Solutions drives **$5.31M** in total YTD invoiced volume with our highest standard margins (**24.9% CTO**), meaning point-of-care vertical integrations yield the best overall enterprise portfolio health compared to third-party direct resells (averaging ~12.6% CTO).
                  </p>
                </div>
              </div>

              {/* Linecard Channel Pipeline (Right side - 5 cols) */}
              <div className="lg:col-span-5 bg-slate-900 border border-slate-800 rounded-3xl p-5 shadow-lg space-y-4">
                <div className="pb-2 border-b border-slate-800 flex justify-between items-center">
                  <h3 className="font-extrabold text-sm text-slate-300 uppercase tracking-wider flex items-center gap-2">
                    <Layers className="h-4 w-4 text-indigo-400" />
                    Channel & Pipeline Deals
                  </h3>
                  <span className="text-[10px] font-mono text-slate-500">Categories F-J</span>
                </div>

                <div className="space-y-3.5 overflow-y-auto max-h-[380px] pr-1 scrollbar">
                  {LinecardChannelPipeline.map((cat) => (
                    <div key={cat.letter} className="p-3 bg-slate-950 rounded-xl border border-slate-850 text-left space-y-2">
                      <div className="flex justify-between items-start">
                        <div className="flex items-center gap-2">
                          <span className="h-6 w-6 rounded-lg bg-indigo-950 border border-indigo-800 flex items-center justify-center font-black text-xs text-indigo-300">
                            {cat.letter}
                          </span>
                          <div>
                            <strong className="text-slate-200 text-xs block leading-tight">{cat.name}</strong>
                            <span className="text-[10px] text-slate-500 font-mono">Primary: {cat.partner}</span>
                          </div>
                        </div>
                        <span className={`text-[9px] font-bold px-2 py-0.5 rounded-full font-mono uppercase ${
                          cat.status === 'Active' ? 'bg-emerald-950 text-emerald-400 border border-emerald-900/40' :
                          cat.status === 'Evaluation' ? 'bg-cyan-950 text-cyan-400 border border-cyan-900/40' :
                          cat.status === 'Negotiation' ? 'bg-orange-950 text-orange-400 border border-orange-900/40' :
                          'bg-slate-900 text-slate-400'
                        }`}>
                          {cat.status}
                        </span>
                      </div>
                      
                      <p className="text-[11px] text-slate-400 leading-normal line-clamp-2">{cat.items}</p>

                      <div className="flex justify-between items-center text-[11px] pt-1.5 border-t border-slate-900 font-mono">
                        <span className="text-slate-500">Opps: <strong className="text-slate-300">{cat.opps} Active</strong></span>
                        <span className="text-emerald-400">{cat.range}</span>
                      </div>
                    </div>
                  ))}
                </div>
              </div>

            </div>

            {/* Rep Sourcing & Contacts Directory */}
            <div className="bg-slate-900 border border-slate-800 rounded-3xl p-6 shadow-xl space-y-6">
              
              <div className="flex flex-col sm:flex-row justify-between items-start sm:items-center pb-3 border-b border-slate-800 gap-4">
                <div className="text-left">
                  <h3 className="font-extrabold text-sm text-slate-300 uppercase tracking-wider flex items-center gap-2">
                    <Users className="h-4 w-4 text-cyan-400" />
                    Channel Sourcing & Contact Directory
                  </h3>
                  <p className="text-xs text-slate-500 mt-0.5">Locate certified regional manufacturer reps and technical advisors</p>
                </div>
                
                {/* Contact Search box */}
                <div className="relative w-full sm:w-64">
                  <Search className="absolute left-3 top-2.5 h-3.5 w-3.5 text-slate-500" />
                  <input 
                    type="text" 
                    placeholder="Filter reps by name or company..." 
                    value={contactSearch}
                    onChange={(e) => setContactSearch(e.target.value)}
                    className="w-full pl-8 pr-3 py-1.5 text-xs bg-slate-950 border border-slate-850 rounded-xl focus:outline-none focus:border-cyan-500 text-slate-300 placeholder-slate-500"
                  />
                </div>
              </div>

              {/* Contact card Grid */}
              <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-5 text-left">
                {filteredContacts.length === 0 ? (
                  <div className="col-span-full text-center py-6 text-slate-500 text-xs font-mono">
                    No contacts matched your filter.
                  </div>
                ) : (
                  filteredContacts.map((c) => (
                    <div key={c.name} className="p-4 bg-slate-950 rounded-2xl border border-slate-850 flex flex-col justify-between hover:border-slate-700 transition-all duration-200">
                      <div className="space-y-2">
                        <div className="flex justify-between items-start">
                          <div>
                            <strong className="text-slate-100 text-sm block">{c.name}</strong>
                            <span className="text-[10px] text-cyan-400 font-mono font-bold tracking-wide uppercase">{c.company}</span>
                          </div>
                          <span className="text-[10px] bg-slate-900 border border-slate-800 px-2 py-0.5 rounded text-slate-400">
                            {c.title}
                          </span>
                        </div>
                        <p className="text-[11px] text-slate-400 leading-normal font-sans italic">&quot;{c.scope}&quot;</p>
                      </div>

                      <div className="mt-4 pt-3 border-t border-slate-900 flex flex-col gap-2 text-xs font-mono">
                        <a href={`tel:${c.phone}`} className="flex items-center gap-2 text-slate-300 hover:text-cyan-400 transition-colors">
                          <Phone className="h-3.5 w-3.5 text-slate-500" /> {c.phone}
                        </a>
                        <a href={`mailto:${c.email}`} className="flex items-center gap-2 text-slate-300 hover:text-cyan-400 transition-colors">
                          <Mail className="h-3.5 w-3.5 text-slate-500" /> {c.email}
                        </a>
                      </div>
                    </div>
                  ))
                )}
              </div>

            </div>

          </div>
        )}

        {/* ==========================================
            TAB 4: HIMSS EMRAM & COGNITIVE WORKFLOWS
           ========================================== */}
        {activeTab === 'himss' && (
          <div className="space-y-8 animate-fadeIn">
            {/* Main Header */}
            <div className="text-center max-w-3xl mx-auto space-y-3">
              <span className="text-xs uppercase font-extrabold tracking-widest text-cyan-400 px-3 py-1 rounded-full bg-cyan-950/50 border border-cyan-800/50 inline-block">
                Digital Maturity Alignment
              </span>
              <h2 className="text-3xl font-black text-white tracking-tight">HIMSS EMRAM & Nurse Workflows</h2>
              <p className="text-slate-400 text-sm leading-relaxed">
                Understand the 7 Stages of the Electronic Medical Record Adoption Model, and how Howard reduces cognitive load to eliminate nurse burnout.
              </p>
            </div>

            {/* Interactive EMRAM Ladder */}
            <div className="grid grid-cols-1 lg:grid-cols-12 gap-8">
              
              {/* EMRAM Stages Selection (Left Column) */}
              <div className="lg:col-span-5 bg-slate-900 p-5 rounded-3xl border border-slate-800 space-y-3 shadow-lg text-left">
                <h4 className="font-bold text-sm text-slate-300 uppercase tracking-wider mb-4 border-b border-slate-800 pb-2">
                  EMRAM Stage Navigator
                </h4>
                
                <div className="space-y-2">
                  {[7, 6, 5, 4, 3, 2, 1, 0].map(stage => (
                    <button
                      key={stage}
                      onClick={() => setActiveMaturityStage(stage)}
                      className={`w-full p-3 rounded-xl flex items-center justify-between transition-all duration-200 text-xs ${
                        activeMaturityStage === stage
                          ? 'bg-gradient-to-r from-cyan-500 to-indigo-600 text-slate-950 font-bold'
                          : 'bg-slate-950 hover:bg-slate-850 text-slate-300 border border-slate-900'
                      }`}
                    >
                      <span className="flex items-center gap-2">
                        <span className={`h-4 w-4 rounded-full flex items-center justify-center text-[10px] ${
                          activeMaturityStage === stage ? 'bg-slate-950 text-cyan-400' : 'bg-slate-900 text-slate-400'
                        }`}>
                          {stage}
                        </span>
                        Stage {stage}
                      </span>
                      <span className="text-[10px] opacity-80 font-mono">
                        {stage === 7 && 'Complete Paperless EPR'}
                        {stage === 6 && 'Physician Documentation & CLMA'}
                        {stage === 5 && 'Full Radiology PACS'}
                        {stage === 4 && 'CPOE On One Inpatient Unit'}
                        {stage === 3 && 'Clinical/Nurse Documentation'}
                        {stage === 2 && 'CDR & basic HIE'}
                        {stage === 1 && 'Ancillaries installed'}
                        {stage === 0 && 'Missing Core Systems'}
                      </span>
                    </button>
                  ))}
                </div>
              </div>

              {/* EMRAM Stage Details (Right Column) */}
              <div className="lg:col-span-7 bg-slate-900 border border-slate-800 rounded-3xl p-6 shadow-2xl text-left space-y-6">
                <div className="pb-4 border-b border-slate-800">
                  <span className="text-[10px] text-cyan-400 font-mono tracking-wider uppercase block">HIMSS Analytics Standard</span>
                  <h3 className="text-xl font-bold text-white">Stage {activeMaturityStage} Cumulative Capabilities</h3>
                </div>

                <div className="text-sm space-y-4 text-slate-300 leading-relaxed">
                  {activeMaturityStage === 7 && (
                    <div className="space-y-4">
                      <p>At **Stage 7**, the hospital environment is essentially **paperless**. All inpatient units, Emergency Departments, and outpatient clinics operate under a unified, real-time data flow.</p>
                      <div className="p-3.5 bg-emerald-950/20 border border-emerald-900/40 rounded-xl space-y-2">
                        <strong className="text-emerald-300 text-xs block">Howard Support Alignment:</strong>
                        <p className="text-xs text-slate-300">We establish high-availability computing backbones, advanced backup disaster recovery setups, and provide real-time device health feeds (battery/system) so clinical staff experience zero paper-based backup bottlenecks.</p>
                      </div>
                    </div>
                  )}

                  {activeMaturityStage === 6 && (
                    <div className="space-y-4">
                      <p>At **Stage 6**, the hospital implements **Closed Loop Medication Administration (CLMA)**. Order is verified by the pharmacist, and at the bedside, technology-assisted verification of the "5 Rights" ensures safe delivery.</p>
                      <div className="p-3.5 bg-emerald-950/20 border border-emerald-900/40 rounded-xl space-y-2">
                        <strong className="text-emerald-300 text-xs block">Howard Support Alignment:</strong>
                        <p className="text-xs text-slate-300">Our medical carts utilize integrated lockable medication bins, advanced barcode scanners, and single-source workstations that secure the bedside verification process under robust compliance frameworks.</p>
                      </div>
                    </div>
                  )}

                  {activeMaturityStage === 5 && (
                    <div className="space-y-4">
                      <p>At **Stage 5**, **Full Radiology PACS** is deployed. Radiology exams are stored digitally, accessible across the intranet, and available off-site. Cardiology PACS provides diagnostic continuity.</p>
                      <div className="p-3.5 bg-emerald-950/20 border border-emerald-900/40 rounded-xl space-y-2">
                        <strong className="text-emerald-300 text-xs block">Howard Support Alignment:</strong>
                        <p className="text-xs text-slate-300">We deploy high-definition ViewSonic medical-grade displays and specialized workstations configured to handle large diagnostic PACS image files instantly at the patient&apos;s bedside.</p>
                      </div>
                    </div>
                  )}

                  {activeMaturityStage === 4 && (
                    <div className="space-y-4">
                      <p>At **Stage 4**, **Computerized Physician Order Entry (CPOE)** is implemented with clinical decision support (CDS) in at least one inpatient ward, progressing to hospital-wide at Stage 7.</p>
                    </div>
                  )}

                  {activeMaturityStage <= 3 && (
                    <div className="space-y-4">
                      <p>Stages 0 through 3 represent the foundational layers: installing auxiliary systems (Lab, Rad, Pharmacy), creating a central repository, and transitioning nursing documentation to flow-sheets.</p>
                    </div>
                  )}
                </div>

                {/* Cognitive Load Simulator */}
                <div className="pt-6 border-t border-slate-800 space-y-4">
                  <h4 className="text-xs uppercase font-extrabold tracking-widest text-cyan-400 font-mono">
                    Nurse Cognitive Load Simulator (Mayo Clinic Context)
                  </h4>
                  <p className="text-xs text-slate-400 leading-relaxed">
                    Clinicians suffer under heavy cognitive burden due to excessive clicks and disjointed software. Play with the slider below to see how optimizing the workspace directly alleviates nurse burnout.
                  </p>

                  <div className="space-y-4 bg-slate-950 p-4 rounded-2xl border border-slate-850">
                    <div className="flex justify-between text-xs font-mono">
                      <span>Extrinsic Burden (Complexity & Clicks):</span>
                      <span className="text-cyan-400 font-bold">{extrinsicBurden}%</span>
                    </div>
                    <input 
                      type="range" 
                      min="10" 
                      max="100" 
                      value={extrinsicBurden}
                      onChange={(e) => setExtrinsicBurden(Number(e.target.value))}
                      className="w-full h-1 bg-slate-800 rounded-lg appearance-none cursor-pointer accent-cyan-500"
                    />

                    {/* Results indicators */}
                    <div className="grid grid-cols-1 sm:grid-cols-2 gap-4 text-xs pt-2">
                      <div className="p-3 bg-slate-900 rounded-xl border border-slate-800 flex justify-between items-center">
                        <span className="text-slate-400">Nurse Burnout Index:</span>
                        <strong className={`font-mono text-sm ${nurseBurnoutIndex > 75 ? 'text-rose-400' : 'text-emerald-400'}`}>
                          {nurseBurnoutIndex} / 100
                        </strong>
                      </div>
                      <div className="p-3 bg-slate-900 rounded-xl border border-slate-800 flex justify-between items-center">
                        <span className="text-slate-400">Time Saved / Shift:</span>
                        <strong className="text-emerald-400 font-mono text-sm">
                          {timeSavedPerShift} Minutes
                        </strong>
                      </div>
                    </div>
                  </div>
                </div>

              </div>
            </div>
          </div>
        )}

        {/* ==========================================
            TAB 5: SUMMIT & OUTREACH PLANNER
           ========================================== */}
        {activeTab === 'summit' && (
          <div className="space-y-8 animate-fadeIn">
            
            {/* Top Row: Info card and Booth layout */}
            <div className="grid grid-cols-1 lg:grid-cols-12 gap-8">
              
              {/* Booth visualizer */}
              <div className="lg:col-span-7 bg-slate-900 p-6 rounded-3xl border border-slate-800 shadow-xl space-y-6 text-left">
                <div className="pb-3 border-b border-slate-800">
                  <h3 className="text-lg font-bold text-white flex items-center gap-2">
                    <MapPin className="h-5 w-5 text-rose-400" />
                    Kimpton EPIC Foyer Booth (10&apos; x 6.5&apos;)
                  </h3>
                  <p className="text-xs text-slate-400 mt-0.5">Metropolis Ballroom, 14th Floor</p>
                </div>

                {/* Booth layout diagram */}
                <div className="bg-slate-950 rounded-2xl p-4 border border-slate-800 space-y-4">
                  <span className="text-[10px] text-slate-500 uppercase font-mono block">Ecosystem Booth Layout Diagram</span>
                  
                  <div className="border border-dashed border-slate-800 h-64 relative rounded-xl flex flex-col justify-between p-4 bg-slate-950/80">
                    
                    {/* Backdrop */}
                    <div className="absolute top-2 left-4 right-4 h-6 bg-indigo-950 border border-indigo-800 rounded flex items-center justify-center text-[10px] font-bold text-slate-300 uppercase tracking-widest">
                      Ecosystem Partner Backdrop (8&apos; x 6.5&apos; Tension Fabric)
                    </div>

                    {/* ViewSonic screen on backwall */}
                    <div className="absolute top-9 left-1/2 -translate-x-1/2 h-12 w-32 bg-slate-900 border border-slate-700 rounded-md flex items-center justify-center text-[9px] font-mono text-cyan-400">
                      ViewSonic 55&quot; Display
                    </div>

                    {/* Howard Care Pro WOW Cart centered */}
                    <div className="absolute bottom-6 left-1/2 -translate-x-1/2 h-16 w-24 bg-gradient-to-tr from-cyan-500/20 to-indigo-500/20 border-2 border-cyan-500 rounded-xl flex flex-col justify-center items-center shadow-lg shadow-cyan-500/10">
                      <span className="text-[10px] text-white font-extrabold uppercase">Care Pro</span>
                      <span className="text-[8px] text-slate-300 font-mono">(VitalChat Demo)</span>
                    </div>

                    {/* Table positioned to the left side */}
                    <div className="absolute bottom-6 left-4 h-12 w-20 bg-slate-900 border border-slate-850 rounded flex flex-col justify-center items-center text-[8px] text-slate-400 font-mono">
                      <span>6ft Table</span>
                      <span>(Armis Shield)</span>
                    </div>

                    {/* Foyer Boundary line at the bottom */}
                    <div className="absolute bottom-1 left-0 right-0 border-t border-dotted border-rose-500/40 text-center">
                      <span className="text-[8px] text-rose-400/60 uppercase tracking-widest font-mono">14th Floor Ballroom Walkway (Foyer)</span>
                    </div>
                  </div>
                </div>

                {/* Booth layout key explanation */}
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-4 text-xs">
                  <div className="p-3 bg-slate-950 rounded-xl border border-slate-800 space-y-1">
                    <strong className="text-cyan-400 text-[11px] block">Command Center Focus:</strong>
                    <p className="text-slate-400 text-[11px]">Walk-in layout allows the Howard Care Pro WoW cart to act as the Hero piece, showcasing full physical-digital symmetry.</p>
                  </div>
                  <div className="p-3 bg-slate-950 rounded-xl border border-slate-800 space-y-1">
                    <strong className="text-indigo-400 text-[11px] block">Live Telehealth Mock:</strong>
                    <p className="text-slate-400 text-[11px]">Visitors calling from the desk (command hub) directly onto the mobile cart to experience Zero-Trust encrypted feeds.</p>
                  </div>
                </div>

              </div>

              {/* Pitch Creator */}
              <div className="lg:col-span-5 bg-slate-900 p-6 rounded-3xl border border-slate-800 shadow-xl space-y-6 text-left">
                <div className="pb-3 border-b border-slate-800">
                  <h3 className="text-lg font-bold text-white flex items-center gap-2">
                    <Sparkles className="h-5 w-5 text-cyan-400" />
                    30-Second Elevator Pitch
                  </h3>
                  <p className="text-xs text-slate-400 mt-0.5">Instantly adapt your strategy based on target title</p>
                </div>

                <div className="space-y-4">
                  <div className="flex gap-2 p-1.5 bg-slate-950 rounded-xl border border-slate-800">
                    {['CNO', 'CIO', 'CFO'].map(role => (
                      <button
                        key={role}
                        onClick={() => setSelectedPitchRole(role)}
                        className={`flex-1 py-2 text-xs font-bold rounded-lg tracking-wide transition-all ${
                          selectedPitchRole === role
                            ? 'bg-cyan-500 text-slate-950'
                            : 'text-slate-400 hover:text-slate-200'
                        }`}
                      >
                        {role === 'CNO' && 'Clinical / CNO'}
                        {role === 'CIO' && 'Security / CIO'}
                        {role === 'CFO' && 'Financial / CFO'}
                      </button>
                    ))}
                  </div>

                  {/* Pitch Script Area */}
                  <div className="bg-slate-950 p-4 rounded-xl border border-slate-800 relative">
                    <div className="absolute top-2.5 right-2.5">
                      <button 
                        onClick={() => handleCopy(getElevatorPitch(selectedPitchRole))}
                        className="p-1.5 hover:bg-slate-900 rounded-lg text-slate-400 hover:text-cyan-400 transition-colors"
                        title="Copy to clipboard"
                      >
                        <Copy className="h-4 w-4" />
                      </button>
                    </div>
                    <span className="text-[10px] text-slate-500 uppercase font-mono block mb-2">Pitch Script (Editable)</span>
                    <p className="text-xs text-slate-200 italic leading-relaxed pr-6">
                      {getElevatorPitch(selectedPitchRole)}
                    </p>
                  </div>

                  {/* Copy status toast */}
                  {copiedText && (
                    <div className="text-[11px] text-emerald-400 bg-emerald-950/40 p-2 border border-emerald-800 rounded-xl text-center">
                      Copied template successfully!
                    </div>
                  )}

                  {/* Ecosystem Benefits list */}
                  <div className="space-y-2 text-xs text-slate-300">
                    <strong className="text-slate-400 block font-mono uppercase text-[10px]">Ecosystem Wins Mentioned</strong>
                    <div className="grid grid-cols-1 sm:grid-cols-2 gap-2">
                      <div className="p-2 bg-slate-950 rounded-lg border border-slate-850">
                        <strong className="text-cyan-400">VitalChat:</strong> -70% sitter staffing costs.
                      </div>
                      <div className="p-2 bg-slate-950 rounded-lg border border-slate-850">
                        <strong className="text-rose-400">Armis:</strong> Zero-Trust bedside shield.
                      </div>
                    </div>
                  </div>

                </div>
              </div>

            </div>

            {/* Dynamic Follow-Up & Outreach Generator */}
            <div className="bg-slate-900 p-6 rounded-3xl border border-slate-800 shadow-xl text-left space-y-6">
              <div className="pb-3 border-b border-slate-800 flex justify-between items-center">
                <div>
                  <h3 className="text-lg font-bold text-white flex items-center gap-2">
                    <Send className="h-5 w-5 text-indigo-400" />
                    Dynamic Outreach Template Generator
                  </h3>
                  <p className="text-xs text-slate-400 mt-0.5">Customize your post-summit client follow-up with real-world context</p>
                </div>
              </div>

              <div className="grid grid-cols-1 md:grid-cols-12 gap-6">
                
                {/* Customizer Inputs (Left side) */}
                <div className="md:col-span-4 space-y-4 text-xs">
                  <div className="space-y-1.5">
                    <label className="text-slate-400 font-mono uppercase text-[10px]">Client Contact Name</label>
                    <input 
                      type="text" 
                      value={outreachContact}
                      onChange={(e) => setOutreachContact(e.target.value)}
                      className="w-full px-3 py-2 bg-slate-950 border border-slate-800 rounded-xl text-slate-200 focus:outline-none focus:border-cyan-500"
                    />
                  </div>

                  <div className="space-y-1.5">
                    <label className="text-slate-400 font-mono uppercase text-[10px]">Hospital System</label>
                    <input 
                      type="text" 
                      value={outreachHospital}
                      onChange={(e) => setOutreachHospital(e.target.value)}
                      className="w-full px-3 py-2 bg-slate-950 border border-slate-800 rounded-xl text-slate-200 focus:outline-none focus:border-cyan-500"
                    />
                  </div>

                  <div className="space-y-1.5">
                    <label className="text-slate-400 font-mono uppercase text-[10px]">Specific Chat Topic</label>
                    <input 
                      type="text" 
                      value={outreachTopic}
                      onChange={(e) => setOutreachTopic(e.target.value)}
                      className="w-full px-3 py-2 bg-slate-950 border border-slate-800 rounded-xl text-slate-200 focus:outline-none focus:border-cyan-500"
                    />
                  </div>
                </div>

                {/* Generated Template Output (Right side) */}
                <div className="md:col-span-8 flex flex-col justify-between">
                  <div className="bg-slate-950 p-5 rounded-2xl border border-slate-800 relative space-y-3 font-mono text-xs text-slate-300">
                    <div className="absolute top-3 right-3">
                      <button 
                        onClick={() => handleCopy(`Subject: Following up from the Innovation Summit / Alexandra Gulledge\n\nHi ${outreachContact},\n\nIt was great connecting at the Metropolis Ballroom during the Innovation Summit! I particularly enjoyed our brief chat about ${outreachTopic}.\n\nAs promised, I'm attaching our latest "Elevating Health Outcomes" guide and our brief on Rural Hospital IT strategy.\n\nAt our booth, we demonstrated how Howard Medical integrates VitalChat's AI virtual nurse monitoring and Armis's Zero-Trust endpoint security directly into our Care Pro carts, helping teams reduce deployment friction by up to 30%.\n\nI'd love to dive deeper into how this "self-shielding command center" can support your upcoming clinical projects.\n\nAre you free for a 10-minute "hello" next Tuesday or Wednesday?\n\nBest regards,\n\nAlexandra Gulledge\nMedical Account Executive, Howard Medical`)}
                        className="p-1.5 hover:bg-slate-900 rounded-lg text-slate-400 hover:text-cyan-400 transition-colors"
                        title="Copy email template"
                      >
                        <Copy className="h-4 w-4" />
                      </button>
                    </div>

                    <p className="text-cyan-400 font-bold">Subject: Following up from the Innovation Summit / [Your Name]</p>
                    <p className="leading-relaxed">Hi {outreachContact},</p>
                    <p className="leading-relaxed">It was great connecting at the Metropolis Ballroom during the Innovation Summit! I particularly enjoyed our brief chat about <span className="text-cyan-300 underline">{outreachTopic}</span> at {outreachHospital}.</p>
                    <p className="leading-relaxed">As promised, I&apos;m attaching our latest &quot;Elevating Health Outcomes&quot; guide and our brief on Rural Hospital IT strategy.</p>
                    <p className="leading-relaxed">At our booth, we demonstrated how Howard Medical integrates **VitalChat&apos;s AI virtual nurse monitoring** and **Armis&apos;s Zero-Trust endpoint security** directly into our **Care Pro carts**, helping teams reduce deployment friction by up to 30%.</p>
                    <p className="leading-relaxed">I&apos;d love to dive deeper into how this &quot;self-shielding command center&quot; can support your upcoming clinical projects.</p>
                    <p className="leading-relaxed">Are you free for a 10-minute &quot;hello&quot; next Tuesday or Wednesday?</p>
                    <p className="leading-relaxed">Best regards,</p>
                    <p className="leading-relaxed text-cyan-400">[Your Name]<br />Medical Account Executive, Howard Medical</p>
                  </div>
                </div>

              </div>
            </div>

          </div>
        )}

      </main>

      {/* ==========================================
          PREMIUM SYSTEM FOOTER
         ========================================== */}
      <footer className="bg-slate-900 border-t border-slate-800 py-8 text-center text-xs text-slate-500">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 space-y-4">
          <p className="leading-relaxed">
            Howard Medical • Ecosystem Strategy & Connected Bedside Command Suite. Licensed for South Florida Medical Accounts.<br />
            Powered by partner synergy with <strong className="text-slate-300">VitalChat, Armis, and ViewSonic</strong>.
          </p>
          <div className="flex justify-center gap-4 text-[10px] font-mono">
            <span>Server Latency: <strong className="text-cyan-400">0.02ms</strong></span>
            <span>Ecosystem Nodes Secured: <strong className="text-cyan-400">3,700+</strong></span>
            <span>HIMSS Compliance Level: <strong className="text-cyan-400">Stage 7 Ready</strong></span>
          </div>
        </div>
      </footer>

    </div>
  );
}

```
