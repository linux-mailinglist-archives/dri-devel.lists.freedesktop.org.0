Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 508D134B87
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 17:05:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 201108918A;
	Tue,  4 Jun 2019 15:05:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E1E8918A
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 15:05:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jun 2019 08:05:39 -0700
X-ExtLoop1: 1
Received: from irsmsx107.ger.corp.intel.com ([163.33.3.99])
 by orsmga006.jf.intel.com with ESMTP; 04 Jun 2019 08:05:39 -0700
Received: from irsmsx104.ger.corp.intel.com ([169.254.5.93]) by
 IRSMSX107.ger.corp.intel.com ([169.254.10.142]) with mapi id 14.03.0415.000;
 Tue, 4 Jun 2019 16:05:38 +0100
From: "Ser, Simon" <simon.ser@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Linking ALSA playback devices and DRM connectors
Thread-Topic: Linking ALSA playback devices and DRM connectors
Thread-Index: AQHVGub3qPpDIp0ZmkGUsrmQWEy2vg==
Date: Tue, 4 Jun 2019 15:05:37 +0000
Message-ID: <f69f48bd4b9b2dc6f8228cd47406882c71758cdf.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.72.181]
Content-ID: <391125E733B4D941BB49D82C9C9A0F19@intel.com>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksDQoNCkknbSB0cnlpbmcgdG8gbGluayBBTFNBIHBsYXliYWNrIGRldmljZXMgYW5kIERSTSBj
b25uZWN0b3JzLiBJbiBvdGhlcg0Kd29yZHMsIEknZCBsaWtlIHRvIGJlIGFibGUgdG8ga25vdyB3
aGljaCBBTFNBIGRldmljZSBJIHNob3VsZCBvcGVuIHRvDQpwbGF5IGF1ZGlvIG9uIGEgZ2l2ZW4g
Y29ubmVjdG9yLg0KDQpVbmZvcnR1bmF0ZWx5LCBJIGhhdmVuJ3QgZm91bmQgYSB3YXkgdG8gZXh0
cmFjdCB0aGlzIGluZm9ybWF0aW9uLiBJDQprbm93IC9wcm9jL2Fzb3VuZC9jYXJkTi9lbGQqIGV4
cG9zZSB0aGUgRURJRC1saWtlIGRhdGEuIEhvd2V2ZXIgYnkNCmxvb2tpbmcgYXQgdGhlIEFMU0Eg
QVBJIChhbHNvOiBhcGxheSAtbCBhbmQgLUwpIEkgY2FuJ3QgZmluZCBhIHdheSB0bw0KZmlndXJl
IG91dCB3aGljaCBQQ00gZGV2aWNlIG1hcHMgdG8gdGhlIEVMRC4NCg0KQW0gSSBtaXNzaW5nIHNv
bWV0aGluZz8NCg0KSWYgbm90LCB3aGF0IHdvdWxkIGJlIHRoZSBiZXN0IHdheSB0byBleHBvc2Ug
dGhpcz8NCg0KLSBBIHN5bWxpbmsgdG8gdGhlIEFMU0EgYXVkaW8gUENNIGRldmljZSBpbg0KICAv
c3lzL2NsYXNzL2RybS9jYXJkTi1DT05ORUNUT1I/DQotIEEgc3ltbGluayB0byB0aGUgRFJNIGNv
bm5lY3RvciBpbiAvc3lzL2NsYXNzL3NvdW5kL3BjbSo/DQotIEEgRFJNIGNvbm5lY3RvciBwcm9w
ZXJ0eT8NCi0gU29tZWhvdyBleHBvc2UgdGhlIGNvbm5lY3RvciBuYW1lIHZpYSB0aGUgQUxTQSBB
UEk/DQotIEV4cG9zZSB0aGUgY29ubmVjdG9yIEVESUQgdmlhIEFMU0E/DQotIE90aGVyIGlkZWFz
Pw0KDQpUaGFua3MhDQoNClNpbW9uIFNlcg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
