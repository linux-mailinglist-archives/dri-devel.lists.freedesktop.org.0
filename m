Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5DE32F03
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 13:53:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2863E891AD;
	Mon,  3 Jun 2019 11:53:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F8F4891AD;
 Mon,  3 Jun 2019 11:53:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jun 2019 04:53:33 -0700
X-ExtLoop1: 1
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by orsmga005.jf.intel.com with ESMTP; 03 Jun 2019 04:53:33 -0700
Received: from FMSMSX109.amr.corp.intel.com (10.18.116.9) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 3 Jun 2019 04:53:33 -0700
Received: from BGSMSX108.gar.corp.intel.com (10.223.4.192) by
 fmsmsx109.amr.corp.intel.com (10.18.116.9) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 3 Jun 2019 04:53:32 -0700
Received: from bgsmsx104.gar.corp.intel.com ([169.254.5.115]) by
 BGSMSX108.gar.corp.intel.com ([169.254.8.94]) with mapi id 14.03.0415.000;
 Mon, 3 Jun 2019 17:23:28 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [PATCH 3/4] drm: Fixed doc warnings in drm uapi header
Thread-Topic: [PATCH 3/4] drm: Fixed doc warnings in drm uapi header
Thread-Index: AQHVFlUlv/61Dzny1kaBFiYnKuMl8qaJQxUAgACWA0A=
Date: Mon, 3 Jun 2019 11:53:28 +0000
Message-ID: <E7C9878FBA1C6D42A1CA3F62AEB6945F82035ABA@BGSMSX104.gar.corp.intel.com>
References: <1559159944-21103-1-git-send-email-uma.shankar@intel.com>
 <1559159944-21103-4-git-send-email-uma.shankar@intel.com>
 <20190603082600.GK21222@phenom.ffwll.local>
In-Reply-To: <20190603082600.GK21222@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZjk1YTFlNGQtYWYzNy00YjYyLWE1MWEtODU1YTg3ZjY5NDQ2IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiaHZjS3o4K0JxSlppU21lR3ZRS2l1M1JFRFJLN1J0UFkwWXhScURkQjNDK2daV0s1cDFNa1cxNDY1V2JPclpndSJ9
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
dDogTW9uZGF5LCBKdW5lIDMsIDIwMTkgMTo1NiBQTQo+VG86IFNoYW5rYXIsIFVtYSA8dW1hLnNo
YW5rYXJAaW50ZWwuY29tPgo+Q2M6IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7Cj5tYWFydGVuLmxhbmtob3JzdEBsaW51eC5p
bnRlbC5jb207IHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tOyBTaGFybWEsIFNoYXNoYW5r
Cj48c2hhc2hhbmsuc2hhcm1hQGludGVsLmNvbT47IGVtaWwubC52ZWxpa292QGdtYWlsLmNvbTsg
YnJpYW4uc3RhcmtleUBhcm0uY29tOwo+ZGNhc3RhZ25hQGNocm9taXVtLm9yZzsgc2VhbnBhdWxA
Y2hyb21pdW0ub3JnOyBSb3BlciwgTWF0dGhldyBECj48bWF0dGhldy5kLnJvcGVyQGludGVsLmNv
bT47IGpvbmFzQGt3aWJvby5zZTsgZGFuaWVsQGZmd2xsLmNoCj5TdWJqZWN0OiBSZTogW1BBVENI
IDMvNF0gZHJtOiBGaXhlZCBkb2Mgd2FybmluZ3MgaW4gZHJtIHVhcGkgaGVhZGVyCj4KPk9uIFRo
dSwgTWF5IDMwLCAyMDE5IGF0IDAxOjI5OjAzQU0gKzA1MzAsIFVtYSBTaGFua2FyIHdyb3RlOgo+
PiBGaXhlZCBkb2Mgd2FybmluZ3MgaW4gZHJtIHVhcGkgaGVhZGVyLiBBbGwgdGhlIFVBUEkgc3Ry
dWN0dXJlcyBhcmUgbm93Cj4+IGRvY3VtZW50ZWQgaW4ga2VybmVsIGRvYy4KPj4KPj4gU2lnbmVk
LW9mZi1ieTogVW1hIFNoYW5rYXIgPHVtYS5zaGFua2FyQGludGVsLmNvbT4KPgo+QXBwbGllZCwg
dGhhbmtzIGZvciB0aGUgcGF0Y2guCj4KPkxvbmctdGVybSB0aGVyZSdzIG9idmlvdXNseSBhIGxv
dCBtb3JlIHRvIGRvIGhlcmUsIGJ1dCB0aGlzIGF0IGxlYXN0IGdldHMgdXMgc3RhcnRlZC4KPgo+
QnR3IEkgdGhpbmsgaXQnZCBiZSBnb29kIHRvIHNwbGl0IG91dCB0aGUgImFkZCBuZXcgdWFwaSBp
b2N0bCBzdHJ1Y3R1cmVzIHNlY3Rpb24iIHBhcnQKPmZyb20gdGhlIHByZXZpb3VzIHBhdGNoLCBh
bmQgbWVyZ2UgdGhhdCBzZXBhcmF0ZWx5LgoKT2ssIHdpbGwgZG8gdGhlIHNhbWUuCgpSZWdhcmRz
LApVbWEgU2hhbmthcgoKPlRoYW5rcywgRGFuaWVsCj4KPj4gLS0tCj4+ICBpbmNsdWRlL3VhcGkv
ZHJtL2RybV9tb2RlLmggfCAyMiArKysrKysrKysrKysrKysrKysrKysrCj4+ICAxIGZpbGUgY2hh
bmdlZCwgMjIgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2Ry
bS9kcm1fbW9kZS5oIGIvaW5jbHVkZS91YXBpL2RybS9kcm1fbW9kZS5oCj4+IGluZGV4IDVkMzk2
NGYuLjAyYjJhMmIgMTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0vZHJtX21vZGUuaAo+
PiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL2RybV9tb2RlLmgKPj4gQEAgLTg2MSw2ICs4NjEsMTAg
QEAgc3RydWN0IGRybV9mb3JtYXRfbW9kaWZpZXIgeyAgfTsKPj4KPj4gIC8qKgo+PiArICogc3Ry
dWN0IGRybV9tb2RlX2NyZWF0ZV9ibG9iIC0gQ3JlYXRlIE5ldyBibG9jayBwcm9wZXJ0eQo+PiAr
ICogQGRhdGE6IFBvaW50ZXIgdG8gZGF0YSB0byBjb3B5Lgo+PiArICogQGxlbmd0aDogTGVuZ3Ro
IG9mIGRhdGEgdG8gY29weS4KPj4gKyAqIEBibG9iX2lkOiBuZXcgcHJvcGVydHkgSUQuCj4+ICAg
KiBDcmVhdGUgYSBuZXcgJ2Jsb2InIGRhdGEgcHJvcGVydHksIGNvcHlpbmcgbGVuZ3RoIGJ5dGVz
IGZyb20gZGF0YSBwb2ludGVyLAo+PiAgICogYW5kIHJldHVybmluZyBuZXcgYmxvYiBJRC4KPj4g
ICAqLwo+PiBAQCAtODc0LDYgKzg3OCw4IEBAIHN0cnVjdCBkcm1fbW9kZV9jcmVhdGVfYmxvYiB7
ICB9Owo+Pgo+PiAgLyoqCj4+ICsgKiBzdHJ1Y3QgZHJtX21vZGVfZGVzdHJveV9ibG9iIC0gRGVz
dHJveSB1c2VyIGJsb2IKPj4gKyAqIEBibG9iX2lkOiBibG9iX2lkIHRvIGRlc3Ryb3kKPj4gICAq
IERlc3Ryb3kgYSB1c2VyLWNyZWF0ZWQgYmxvYiBwcm9wZXJ0eS4KPj4gICAqLwo+PiAgc3RydWN0
IGRybV9tb2RlX2Rlc3Ryb3lfYmxvYiB7Cj4+IEBAIC04ODEsNiArODg3LDEyIEBAIHN0cnVjdCBk
cm1fbW9kZV9kZXN0cm95X2Jsb2IgeyAgfTsKPj4KPj4gIC8qKgo+PiArICogc3RydWN0IGRybV9t
b2RlX2NyZWF0ZV9sZWFzZSAtIENyZWF0ZSBsZWFzZQo+PiArICogQG9iamVjdF9pZHM6IFBvaW50
ZXIgdG8gYXJyYXkgb2Ygb2JqZWN0IGlkcy4KPj4gKyAqIEBvYmplY3RfY291bnQ6IE51bWJlciBv
ZiBvYmplY3QgaWRzLgo+PiArICogQGZsYWdzOiBmbGFncyBmb3IgbmV3IEZELgo+PiArICogQGxl
c3NlZV9pZDogdW5pcXVlIGlkZW50aWZpZXIgZm9yIGxlc3NlZS4KPj4gKyAqIEBmZDogZmlsZSBk
ZXNjcmlwdG9yIHRvIG5ldyBkcm1fbWFzdGVyIGZpbGUuCj4+ICAgKiBMZWFzZSBtb2RlIHJlc291
cmNlcywgY3JlYXRpbmcgYW5vdGhlciBkcm1fbWFzdGVyLgo+PiAgICovCj4+ICBzdHJ1Y3QgZHJt
X21vZGVfY3JlYXRlX2xlYXNlIHsKPj4gQEAgLTg5OCw2ICs5MTAsMTAgQEAgc3RydWN0IGRybV9t
b2RlX2NyZWF0ZV9sZWFzZSB7ICB9Owo+Pgo+PiAgLyoqCj4+ICsgKiBzdHJ1Y3QgZHJtX21vZGVf
bGlzdF9sZXNzZWVzIC0gTGlzdCBsZXNzZWVzCj4+ICsgKiBAY291bnRfbGVzc2VlczogTnVtYmVy
IG9mIGxlc3NlZXMuCj4+ICsgKiBAcGFkOiBwYWQuCj4+ICsgKiBAbGVzc2Vlc19wdHI6IFBvaW50
ZXIgdG8gbGVzc2Vzcy4KPj4gICAqIExpc3QgbGVzc2VzIGZyb20gYSBkcm1fbWFzdGVyCj4+ICAg
Ki8KPj4gIHN0cnVjdCBkcm1fbW9kZV9saXN0X2xlc3NlZXMgewo+PiBAQCAtOTE4LDYgKzkzNCwx
MCBAQCBzdHJ1Y3QgZHJtX21vZGVfbGlzdF9sZXNzZWVzIHsgIH07Cj4+Cj4+ICAvKioKPj4gKyAq
IHN0cnVjdCBkcm1fbW9kZV9nZXRfbGVhc2UgLSBHZXQgTGVhc2UKPj4gKyAqIEBjb3VudF9vYmpl
Y3RzOiBOdW1iZXIgb2YgbGVhc2VkIG9iamVjdHMuCj4+ICsgKiBAcGFkOiBwYWQuCj4+ICsgKiBA
b2JqZWN0c19wdHI6IFBvaW50ZXIgdG8gb2JqZWN0cy4KPj4gICAqIEdldCBsZWFzZWQgb2JqZWN0
cwo+PiAgICovCj4+ICBzdHJ1Y3QgZHJtX21vZGVfZ2V0X2xlYXNlIHsKPj4gQEAgLTkzOCw2ICs5
NTgsOCBAQCBzdHJ1Y3QgZHJtX21vZGVfZ2V0X2xlYXNlIHsgIH07Cj4+Cj4+ICAvKioKPj4gKyAq
IHN0cnVjdCBkcm1fbW9kZV9yZXZva2VfbGVhc2UgLSBSZXZva2UgbGVhc2UKPj4gKyAqIEBsZXNz
ZWVfaWQ6IFVuaXF1ZSBJRCBvZiBsZXNzZWUuCj4+ICAgKiBSZXZva2UgbGVhc2UKPj4gICAqLwo+
PiAgc3RydWN0IGRybV9tb2RlX3Jldm9rZV9sZWFzZSB7Cj4+IC0tCj4+IDEuOS4xCj4+Cj4KPi0t
Cj5EYW5pZWwgVmV0dGVyCj5Tb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KPmh0
dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
