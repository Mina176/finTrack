import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  Future<void> createTask() async {
    try {
      await Supabase.instance.client
          .from('transactions') 
          .insert({'amount': 1.0}); 

      print('Record created successfully!');
    } catch (e) {
      print('Error creating record: $e');
    }
  }
}
