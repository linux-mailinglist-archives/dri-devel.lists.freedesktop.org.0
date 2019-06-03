Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 858C532F08
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 13:54:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE5089258;
	Mon,  3 Jun 2019 11:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CA99891AD;
 Mon,  3 Jun 2019 11:54:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jun 2019 04:54:17 -0700
X-ExtLoop1: 1
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by fmsmga004.fm.intel.com with ESMTP; 03 Jun 2019 04:54:16 -0700
Received: from fmsmsx153.amr.corp.intel.com (10.18.125.6) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 3 Jun 2019 04:54:17 -0700
Received: from bgsmsx106.gar.corp.intel.com (10.223.43.196) by
 FMSMSX153.amr.corp.intel.com (10.18.125.6) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 3 Jun 2019 04:54:17 -0700
Received: from bgsmsx104.gar.corp.intel.com ([169.254.5.115]) by
 BGSMSX106.gar.corp.intel.com ([169.254.1.50]) with mapi id 14.03.0415.000;
 Mon, 3 Jun 2019 17:24:13 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [PATCH 4/4] video/hdmi: Dropped static functions from kernel doc
Thread-Topic: [PATCH 4/4] video/hdmi: Dropped static functions from kernel doc
Thread-Index: AQHVFlUoXomineaXj0+hJZ2615KygKaJQqwAgACWlyA=
Date: Mon, 3 Jun 2019 11:54:13 +0000
Message-ID: <E7C9878FBA1C6D42A1CA3F62AEB6945F82035AD7@BGSMSX104.gar.corp.intel.com>
References: <1559159944-21103-1-git-send-email-uma.shankar@intel.com>
 <1559159944-21103-5-git-send-email-uma.shankar@intel.com>
 <20190603082432.GJ21222@phenom.ffwll.local>
In-Reply-To: <20190603082432.GJ21222@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOWM1NzhkZDItNTgxNS00MWNhLWFmZWYtMGM4ZTAyOTY0YWQ0IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoibmJzTVdWMGM3dGxScG4yTXJ4QkducDdSdk5rWWZNcEhPSE9mUitKNlV4MkpxZ29YRTJcL1BmTndEXC9yWEVpdTF4In0=
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [10.223.10.10]
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
Cc: "dcastagna@chromium.org" <dcastagna@chromium.org>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "emil.l.velikov@gmail.com" <emil.l.velikov@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cgo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPkZyb206IERhbmllbCBWZXR0ZXIgW21haWx0
bzpkYW5pZWwudmV0dGVyQGZmd2xsLmNoXSBPbiBCZWhhbGYgT2YgRGFuaWVsIFZldHRlcgo+U2Vu
dDogTW9uZGF5LCBKdW5lIDMsIDIwMTkgMTo1NSBQTQo+VG86IFNoYW5rYXIsIFVtYSA8dW1hLnNo
YW5rYXJAaW50ZWwuY29tPgo+Q2M6IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7Cj5tYWFydGVuLmxhbmtob3JzdEBsaW51eC5p
bnRlbC5jb207IHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tOyBTaGFybWEsIFNoYXNoYW5r
Cj48c2hhc2hhbmsuc2hhcm1hQGludGVsLmNvbT47IGVtaWwubC52ZWxpa292QGdtYWlsLmNvbTsg
YnJpYW4uc3RhcmtleUBhcm0uY29tOwo+ZGNhc3RhZ25hQGNocm9taXVtLm9yZzsgc2VhbnBhdWxA
Y2hyb21pdW0ub3JnOyBSb3BlciwgTWF0dGhldyBECj48bWF0dGhldy5kLnJvcGVyQGludGVsLmNv
bT47IGpvbmFzQGt3aWJvby5zZTsgZGFuaWVsQGZmd2xsLmNoCj5TdWJqZWN0OiBSZTogW1BBVENI
IDQvNF0gdmlkZW8vaGRtaTogRHJvcHBlZCBzdGF0aWMgZnVuY3Rpb25zIGZyb20ga2VybmVsIGRv
Ywo+Cj5PbiBUaHUsIE1heSAzMCwgMjAxOSBhdCAwMToyOTowNEFNICswNTMwLCBVbWEgU2hhbmth
ciB3cm90ZToKPj4gRHJvcHBlZCBzdGF0aWMgZnVuY3Rpb25zIGZyb20ga2VybmVsIGRvY3VtZW50
YXRpb24uCj4+Cj4+IFN1Z2dlc3RlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNo
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBVbWEgU2hhbmthciA8dW1hLnNoYW5rYXJAaW50ZWwuY29tPgo+
PiAtLS0KPj4gIGRyaXZlcnMvdmlkZW8vaGRtaS5jIHwgMzIgKysrKysrKysrKysrKysrKy0tLS0t
LS0tLS0tLS0tLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxNiBkZWxl
dGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vaGRtaS5jIGIvZHJpdmVy
cy92aWRlby9oZG1pLmMgaW5kZXgKPj4gYjk5YmEwMS4uNzJjNjU0YiAxMDA2NDQKPj4gLS0tIGEv
ZHJpdmVycy92aWRlby9oZG1pLmMKPj4gKysrIGIvZHJpdmVycy92aWRlby9oZG1pLmMKPj4gQEAg
LTExOTEsMTEgKzExOTEsMTEgQEAgc3RhdGljIGNvbnN0IGNoYXIgKmhkbWlfbnVwc19nZXRfbmFt
ZShlbnVtCj5oZG1pX251cHMgbnVwcykKPj4gIAlyZXR1cm4gIkludmFsaWQiOwo+PiAgfQo+Pgo+
PiAtLyoqCj4+ICsvKgo+PiAgICogaGRtaV9hdmlfaW5mb2ZyYW1lX2xvZygpIC0gbG9nIGluZm8g
b2YgSERNSSBBVkkgaW5mb2ZyYW1lCj4+IC0gKiBAbGV2ZWw6IGxvZ2dpbmcgbGV2ZWwKPj4gLSAq
IEBkZXY6IGRldmljZQo+PiAtICogQGZyYW1lOiBIRE1JIEFWSSBpbmZvZnJhbWUKPj4gKyAqIGxl
dmVsOiBsb2dnaW5nIGxldmVsCj4+ICsgKiBkZXY6IGRldmljZQo+PiArICogZnJhbWU6IEhETUkg
QVZJIGluZm9mcmFtZQo+PiAgICovCj4+ICBzdGF0aWMgdm9pZCBoZG1pX2F2aV9pbmZvZnJhbWVf
bG9nKGNvbnN0IGNoYXIgKmxldmVsLAo+PiAgCQkJCSAgIHN0cnVjdCBkZXZpY2UgKmRldiwKPj4g
QEAgLTEyNjgsMTEgKzEyNjgsMTEgQEAgc3RhdGljIGNvbnN0IGNoYXIgKmhkbWlfc3BkX3NkaV9n
ZXRfbmFtZShlbnVtCj5oZG1pX3NwZF9zZGkgc2RpKQo+PiAgCXJldHVybiAiUmVzZXJ2ZWQiOwo+
PiAgfQo+Pgo+PiAtLyoqCj4+ICsvKgo+PiAgICogaGRtaV9zcGRfaW5mb2ZyYW1lX2xvZygpIC0g
bG9nIGluZm8gb2YgSERNSSBTUEQgaW5mb2ZyYW1lCj4+IC0gKiBAbGV2ZWw6IGxvZ2dpbmcgbGV2
ZWwKPj4gLSAqIEBkZXY6IGRldmljZQo+PiAtICogQGZyYW1lOiBIRE1JIFNQRCBpbmZvZnJhbWUK
Pj4gKyAqIGxldmVsOiBsb2dnaW5nIGxldmVsCj4+ICsgKiBkZXY6IGRldmljZQo+PiArICogZnJh
bWU6IEhETUkgU1BEIGluZm9mcmFtZQo+PiAgICovCj4KPkZvciBpbnRlcm5hbCBmdW5jdGlvbnMg
SSB0aGluayB0aGVyZSdzIG5vdCByZWFsbHkgYW55IHZhbHVlIGluIGRvY3VtZW50aW5nIHRoaXMu
IFRoZQo+dmFyaWFibGUgbmFtZXMgYXJlIG9idmlvdXMgZW5vdWdoLiBJbW8gYmV0dGVyIHRvIGRp
dGNoIHRoaXMgb3V0cmlnaHQuCgpPaywgd2lsbCBkcm9wIHRoZSBjb21tZW50cyBmcm9tIGFsbCB0
aGVzZSBzdGF0aWMgZnVuY3Rpb25zLgoKUmVnYXJkcywKVW1hIFNoYW5rYXIKCj4tRGFuaWVsCj4K
Pj4gIHN0YXRpYyB2b2lkIGhkbWlfc3BkX2luZm9mcmFtZV9sb2coY29uc3QgY2hhciAqbGV2ZWws
Cj4+ICAJCQkJICAgc3RydWN0IGRldmljZSAqZGV2LAo+PiBAQCAtMTQwNCwxMSArMTQwNCwxMSBA
QCBzdGF0aWMgdm9pZCBoZG1pX3NwZF9pbmZvZnJhbWVfbG9nKGNvbnN0IGNoYXIgKmxldmVsLAo+
PiAgCXJldHVybiAiUmVzZXJ2ZWQiOwo+PiAgfQo+Pgo+PiAtLyoqCj4+ICsvKgo+PiAgICogaGRt
aV9hdWRpb19pbmZvZnJhbWVfbG9nKCkgLSBsb2cgaW5mbyBvZiBIRE1JIEFVRElPIGluZm9mcmFt
ZQo+PiAtICogQGxldmVsOiBsb2dnaW5nIGxldmVsCj4+IC0gKiBAZGV2OiBkZXZpY2UKPj4gLSAq
IEBmcmFtZTogSERNSSBBVURJTyBpbmZvZnJhbWUKPj4gKyAqIGxldmVsOiBsb2dnaW5nIGxldmVs
Cj4+ICsgKiBkZXY6IGRldmljZQo+PiArICogZnJhbWU6IEhETUkgQVVESU8gaW5mb2ZyYW1lCj4+
ICAgKi8KPj4gIHN0YXRpYyB2b2lkIGhkbWlfYXVkaW9faW5mb2ZyYW1lX2xvZyhjb25zdCBjaGFy
ICpsZXZlbCwKPj4gIAkJCQkgICAgIHN0cnVjdCBkZXZpY2UgKmRldiwKPj4gQEAgLTE0MzcsMTEg
KzE0MzcsMTEgQEAgc3RhdGljIHZvaWQgaGRtaV9hdWRpb19pbmZvZnJhbWVfbG9nKGNvbnN0IGNo
YXIKPipsZXZlbCwKPj4gIAkJCWZyYW1lLT5kb3dubWl4X2luaGliaXQgPyAiWWVzIiA6ICJObyIp
OyAgfQo+Pgo+PiAtLyoqCj4+ICsvKgo+PiAgICogaGRtaV9kcm1faW5mb2ZyYW1lX2xvZygpIC0g
bG9nIGluZm8gb2YgSERNSSBEUk0gaW5mb2ZyYW1lCj4+IC0gKiBAbGV2ZWw6IGxvZ2dpbmcgbGV2
ZWwKPj4gLSAqIEBkZXY6IGRldmljZQo+PiAtICogQGZyYW1lOiBIRE1JIERSTSBpbmZvZnJhbWUK
Pj4gKyAqIGxldmVsOiBsb2dnaW5nIGxldmVsCj4+ICsgKiBkZXY6IGRldmljZQo+PiArICogZnJh
bWU6IEhETUkgRFJNIGluZm9mcmFtZQo+PiAgICovCj4+ICBzdGF0aWMgdm9pZCBoZG1pX2RybV9p
bmZvZnJhbWVfbG9nKGNvbnN0IGNoYXIgKmxldmVsLAo+PiAgCQkJCSAgIHN0cnVjdCBkZXZpY2Ug
KmRldiwKPj4gLS0KPj4gMS45LjEKPj4KPgo+LS0KPkRhbmllbCBWZXR0ZXIKPlNvZnR3YXJlIEVu
Z2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgo+aHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
