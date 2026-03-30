import 'package:flutter/material.dart';

void main() {
  runApp(const BusinessPlanApp());
}

class BusinessPlanApp extends StatelessWidget {
  const BusinessPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Business Plan - SARL BRIQUETERIE BMO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFB7410E), // Couleur brique / terre cuite
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const BusinessPlanScreen(),
      },
    );
  }
}

class BusinessPlanScreen extends StatelessWidget {
  const BusinessPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Tableau de Bord - Business Plan',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(context),
            const SizedBox(height: 20),
            _buildKeyMetrics(context),
            const SizedBox(height: 20),
            _buildSection(
              context,
              title: '1. Résumé Exécutif',
              icon: Icons.business,
              content: "Création d'une unité industrielle de production de briques (SARL BRIQUETERIE BMO) située à Touggourt, Algérie. Le projet vise à répondre à la forte demande en matériaux de construction dans le sud algérien et sur le territoire national, en valorisant les ressources locales.",
            ),
            _buildFinancialSection(context),
            _buildFinancialChartSection(context), // NOUVEAU GRAPHIQUE
            _buildSection(
              context,
              title: '3. Production & Ressources Humaines',
              icon: Icons.people_alt,
              content: "• Capacité de production estimée : 5 Millions de tonnes.\n• Création d'emplois : 40 postes directs, contribuant au développement socio-économique de la région de Touggourt.\n• Processus industriel optimisé pour garantir une qualité supérieure et un rendement maximal.",
            ),
            _buildEquipmentSection(context), // NOUVELLE SECTION ÉQUIPEMENTS
            _buildSection(
              context,
              title: '5. Localisation Stratégique',
              icon: Icons.location_on,
              content: "Implantation à Touggourt. Cette localisation offre un accès privilégié aux matières premières (argile) et constitue un carrefour logistique stratégique pour la distribution vers les wilayas du Sud et les hauts plateaux.",
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          const Icon(Icons.factory, size: 80, color: Colors.white),
          const SizedBox(height: 16),
          const Text(
            'SARL BRIQUETERIE BMO',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.location_on, color: Colors.white70, size: 18),
              SizedBox(width: 4),
              Text(
                'Touggourt, Algérie',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildKeyMetrics(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Wrap(
        spacing: 16.0,
        runSpacing: 16.0,
        alignment: WrapAlignment.center,
        children: [
          _buildMetricCard(
            context,
            title: 'Investissement',
            value: '3 Milliards',
            unit: 'DA',
            icon: Icons.account_balance_wallet,
          ),
          _buildMetricCard(
            context,
            title: 'Production',
            value: '5 Millions',
            unit: 'Tonnes',
            icon: Icons.inventory,
          ),
          _buildMetricCard(
            context,
            title: 'Effectif',
            value: '40',
            unit: 'Personnes',
            icon: Icons.people,
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard(BuildContext context, {required String title, required String value, required String unit, required IconData icon}) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Theme.of(context).colorScheme.primary, size: 28),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[600],
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          Text(
            unit,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(BuildContext context, {required String title, required IconData icon, required String content}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Colors.grey.shade200),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, color: Theme.of(context).colorScheme.primary),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(height: 24),
              Text(
                content,
                style: TextStyle(
                  fontSize: 15,
                  height: 1.6,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFinancialSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Colors.grey.shade200),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.analytics, color: Theme.of(context).colorScheme.primary),
                  const SizedBox(width: 12),
                  const Text(
                    '2. Plan de Financement',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Divider(height: 24),
              _buildFinanceRow('Montant Investissement', '3 000 000 000 DA'),
              _buildFinanceRow('Durée de remboursement', '15 ans'),
              _buildFinanceRow('Amortissement', '1% à partir de la 6ème année'),
              _buildFinanceRow('Indice de Profitabilité (IP)', '> 1.7'),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green.shade200),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.check_circle, color: Colors.green, size: 20),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Un IP > 1.7 indique une très forte rentabilité. Pour chaque dinar investi, le projet génère plus de 1.7 dinars de valeur actualisée nette.',
                        style: TextStyle(
                          color: Colors.green.shade800, 
                          fontSize: 13,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFinanceRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              label,
              style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFinancialChartSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Colors.grey.shade200),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.bar_chart, color: Theme.of(context).colorScheme.primary),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      'Projection Financière (15 ans)',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const Divider(height: 24),
              Text(
                "Évolution estimée de la trésorerie et début de l'amortissement (1%) à partir de la 6ème année.",
                style: TextStyle(color: Colors.grey[700], fontSize: 14),
              ),
              const SizedBox(height: 32),
              SizedBox(
                height: 220,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(15, (index) {
                    int year = index + 1;
                    bool isGracePeriod = year <= 5;
                    
                    // Simulation visuelle des données
                    double cashFlowHeight = 80.0 + (year * 6); 
                    double repaymentHeight = isGracePeriod ? 0 : 30.0 + (year * 2); 

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Barre de trésorerie
                        Container(
                          width: 14,
                          height: cashFlowHeight,
                          decoration: BoxDecoration(
                            color: Colors.green.shade400,
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                          ),
                        ),
                        const SizedBox(height: 2),
                        // Barre de remboursement
                        Container(
                          width: 14,
                          height: repaymentHeight,
                          decoration: BoxDecoration(
                            color: isGracePeriod ? Colors.transparent : Theme.of(context).colorScheme.primary,
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "A$year",
                          style: TextStyle(
                            fontSize: 11, 
                            color: isGracePeriod ? Colors.grey[600] : Theme.of(context).colorScheme.primary,
                            fontWeight: isGracePeriod ? FontWeight.normal : FontWeight.bold,
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildLegendItem(Colors.green.shade400, "Trésorerie générée"),
                  const SizedBox(width: 16),
                  _buildLegendItem(Theme.of(context).colorScheme.primary, "Amortissement (1%)"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLegendItem(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 12, 
          height: 12, 
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildEquipmentSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Colors.grey.shade200),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.precision_manufacturing, color: Theme.of(context).colorScheme.primary),
                  const SizedBox(width: 12),
                  const Text(
                    '4. Équipements & Infrastructures',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Divider(height: 24),
              _buildEquipmentItem(
                context, 
                icon: Icons.local_fire_department, 
                title: 'Four Tunnel Continu', 
                desc: 'Cuisson haute température optimisée pour une production de masse.'
              ),
              _buildEquipmentItem(
                context, 
                icon: Icons.air, 
                title: 'Séchoir Industriel', 
                desc: 'Réduction rapide de l\'humidité des briques crues avant cuisson.'
              ),
              _buildEquipmentItem(
                context, 
                icon: Icons.view_stream, 
                title: 'Ligne d\'Extrusion', 
                desc: 'Moulage, compactage et découpe automatique de l\'argile.'
              ),
              _buildEquipmentItem(
                context, 
                icon: Icons.settings_suggest, 
                title: 'Broyeurs et Malaxeurs', 
                desc: 'Préparation et traitement de la matière première (argile de Touggourt).'
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEquipmentItem(BuildContext context, {required IconData icon, required String title, required String desc}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Colors.grey.shade700, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(height: 4),
                Text(
                  desc,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 13, height: 1.4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
