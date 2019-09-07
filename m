Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 693BDAC9DD
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2019 01:20:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B8189023;
	Sat,  7 Sep 2019 23:19:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEDE288E37;
 Sat,  7 Sep 2019 23:19:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Sep 2019 16:19:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,478,1559545200"; d="scan'208";a="183471065"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
 by fmsmga008.fm.intel.com with ESMTP; 07 Sep 2019 16:19:56 -0700
Received: from irsmsx106.ger.corp.intel.com ([169.254.8.187]) by
 IRSMSX104.ger.corp.intel.com ([169.254.5.103]) with mapi id 14.03.0439.000;
 Sun, 8 Sep 2019 00:19:55 +0100
From: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "imirkin@alum.mit.edu" <imirkin@alum.mit.edu>
Subject: Re: [PATCH v4 3/7] drm: Add DisplayPort colorspace property
Thread-Topic: [PATCH v4 3/7] drm: Add DisplayPort colorspace property
Thread-Index: AQHVYlULXtt7lENbLk26VEgEx3grD6ced/GAgAADE4CAABxMAIACOMSA
Date: Sat, 7 Sep 2019 23:19:55 +0000
Message-ID: <23376377793be0aecd14e08f6cbda7f699a5c761.camel@intel.com>
References: <20190903091235.32304-1-gwan-gyeong.mun@intel.com>
 <20190903091235.32304-4-gwan-gyeong.mun@intel.com>
 <CAKb7Uvi4aO-im=cBi_xy8QoDhUXsJmuxcL8ewOrMvFbky9Je0g@mail.gmail.com>
 <E7C9878FBA1C6D42A1CA3F62AEB6945F821DC31F@BGSMSX104.gar.corp.intel.com>
 <20190906114255.GS7482@intel.com>
 <CAKb7UvjdjrVtueEDM+eij0LvCrdAbwzUyNpbPde=AZ-7Dega2A@mail.gmail.com>
In-Reply-To: <CAKb7UvjdjrVtueEDM+eij0LvCrdAbwzUyNpbPde=AZ-7Dega2A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.66.149]
Content-ID: <E18DB61C0007914BAE21708C8DCEA379@intel.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Shankar, Uma" <uma.shankar@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDE5LTA5LTA2IGF0IDA5OjI0IC0wNDAwLCBJbGlhIE1pcmtpbiB3cm90ZToNCj4g
T24gRnJpLCBTZXAgNiwgMjAxOSBhdCA3OjQzIEFNIFZpbGxlIFN5cmrDpGzDpA0KPiA8dmlsbGUu
c3lyamFsYUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOg0KPiA+IE9uIEZyaSwgU2VwIDA2LCAyMDE5
IGF0IDExOjMxOjU1QU0gKzAwMDAsIFNoYW5rYXIsIFVtYSB3cm90ZToNCj4gPiA+IA0KPiA+ID4g
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gPiBGcm9tOiBJbGlhIE1pcmtpbiA8
aW1pcmtpbkBhbHVtLm1pdC5lZHU+DQo+ID4gPiA+IFNlbnQ6IFR1ZXNkYXksIFNlcHRlbWJlciAz
LCAyMDE5IDY6MTIgUE0NCj4gPiA+ID4gVG86IE11biwgR3dhbi1neWVvbmcgPGd3YW4tZ3llb25n
Lm11bkBpbnRlbC5jb20+DQo+ID4gPiA+IENjOiBJbnRlbCBHcmFwaGljcyBEZXZlbG9wbWVudCA8
aW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+ID4gPiA+OyBTaGFua2FyLCBVbWEN
Cj4gPiA+ID4gPHVtYS5zaGFua2FyQGludGVsLmNvbT47IGRyaS1kZXZlbCA8DQo+ID4gPiA+IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+DQo+ID4gPiA+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjQgMy83XSBkcm06IEFkZCBEaXNwbGF5UG9ydCBjb2xvcnNwYWNlDQo+ID4gPiA+IHByb3Bl
cnR5DQo+ID4gPiA+IA0KPiA+ID4gPiBTbyBob3cgd291bGQgdGhpcyB3b3JrIHdpdGggYSBEUCsr
IGNvbm5lY3Rvcj8gU2hvdWxkIGl0IGxpc3QNCj4gPiA+ID4gdGhlIEhETUkgb3IgRFANCj4gPiA+
ID4gcHJvcGVydGllcz8gT3IgZG8gd2UgbmVlZCBhIGN1c3RvbSBwcm9wZXJ0eSBjaGVja2VyIHdo
aWNoIGlzDQo+ID4gPiA+IGF3YXJlIG9mIHdoYXQgaXMNCj4gPiA+ID4gY3VycmVudGx5IHBsdWdn
ZWQgaW4gdG8gdmFsaWRhdGUgdGhlIHZhbHVlcz8NCj4gPiA+IA0KPiA+ID4gQUZBSVUgRm9yIERQ
KysgY2FzZXMsIHdlIGRldGVjdCB3aGF0IGtpbmQgb2Ygc2luayBpdHMgZHJpdmluZyBEUA0KPiA+
ID4gb3IgSERNSSAod2l0aCBhIHBhc3NpdmUgZG9uZ2xlKS4NCj4gPiA+IEJhc2VkIG9uIHRoZSB0
eXBlIG9mIHNpbmsgZGV0ZWN0ZWQsIHdlIHNob3VsZCBleHBvc2UgRFAgb3IgSERNSQ0KPiA+ID4g
Y29sb3JzcGFjZXMgdG8gdXNlcnNwYWNlLg0KPiA+IA0KPiA+IEZvciBpOTE1IERQIGNvbm5lY3Rv
ciBhbHdheXMgZHJpdmVzIERQIG1vZGUsIEhETUkgY29ubmVjdG9yIGFsd2F5cw0KPiA+IGRyaXZl
cw0KPiA+IEhETUkgbW9kZSwgZXZlbiB3aGVuIHRoZSBwaHlzaWNhbCBjb25uZWN0b3IgaXMgRFAr
Ky4NCj4gDQo+IFJpZ2h0LCBpOTE1IGNyZWF0ZXMgMiBjb25uZWN0b3JzLCB3aGlsZSBub3V2ZWF1
LCByYWRlb24sIGFuZCBhbWRncHUNCj4gY3JlYXRlIDEgY29ubmVjdG9yIChub3Qgc3VyZSBhYm91
dCBvdGhlciBkcml2ZXJzKSBmb3IgYSBzaW5nbGUNCj4gcGh5c2ljYWwgRFArKyBzb2NrZXQuIFNp
bmNlIHdlIHN1cHBseSB0aGUgbGlzdCBvZiB2YWxpZCB2YWx1ZXMgYXQgdGhlDQo+IHRpbWUgb2Yg
Y3JlYXRpbmcgdGhlIGNvbm5lY3Rvciwgd2UgY2FuJ3Qga25vdyBhdCB0aGF0IHBvaW50IHdoZXRo
ZXINCj4gaW4NCj4gdGhlIGZ1dHVyZSBhIEhETUkgb3IgRFAgd2lsbCBiZSBwbHVnZ2VkIGludG8g
aXQuDQo+IA0KPiAgIC1pbGlhDQpJbGlhLCBkb2VzIGl0IG1lYW4gdGhhdCB0aGUgZHJtX2Nvbm5l
Y3RvciB0eXBlIGlzDQpEUk1fTU9ERV9DT05ORUNUT1JfRGlzcGxheVBvcnQgYW5kIHByb3RvY29s
IGlzIERQKysgbW9kZT8NCg0KQW5kIFZpbGxlIGFuZCBVbWEsICB3aGVuIHdlIGFyZSB1c2Vpbmcg
ZHAgYWN0aXZlIGRvbmdsZSAoRFAgdG8gSERNSQ0KZG9uZ2xlIGFuZCBEUCBicmFuY2ggZGV2aWNl
IGlzIEhETUkpIHNob3VsZCB3ZSBleHBvc2UgSERNSSBjb2xvcnNwYWNlPw0KDQotRy5HLg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
