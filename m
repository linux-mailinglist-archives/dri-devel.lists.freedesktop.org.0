Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C92451BF
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 04:06:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3BD1892FB;
	Fri, 14 Jun 2019 02:06:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 07093892FB
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 02:06:22 +0000 (UTC)
X-UUID: ff4d460d692f4829903bbdf1f207c61a-20190614
X-UUID: ff4d460d692f4829903bbdf1f207c61a-20190614
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1011397144; Fri, 14 Jun 2019 10:06:05 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 14 Jun 2019 10:06:02 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 14 Jun 2019 10:06:00 +0800
Message-ID: <1560477960.4789.5.camel@mtksdaap41>
Subject: Re: [GIT,PULL] mediatek drm fixes for 5.2
From: CK Hu <ck.hu@mediatek.com>
To: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 14 Jun 2019 10:06:00 +0800
In-Reply-To: <20190613082704.GI23020@phenom.ffwll.local>
References: <1560325868.3259.6.camel@mtksdaap41>
 <20190612162538.GA8035@phenom.ffwll.local>
 <1560407478.7597.5.camel@mtksdaap41>
 <20190613082704.GI23020@phenom.ffwll.local>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
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
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDE5LTA2LTEzIGF0IDEwOjI3ICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+
IE9uIFRodSwgSnVuIDEzLCAyMDE5IGF0IDAyOjMxOjE4UE0gKzA4MDAsIENLIEh1IHdyb3RlOgo+
ID4gSGksIERhbmllbDoKPiA+IAo+ID4gT24gV2VkLCAyMDE5LTA2LTEyIGF0IDE4OjI1ICswMjAw
LCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4gPiBPbiBXZWQsIEp1biAxMiwgMjAxOSBhdCAwMzo1
MTowOFBNICswODAwLCBDSyBIdSB3cm90ZToKPiA+ID4gPiBIaSBEYXZlLCBEYW5pZWw6Cj4gPiA+
ID4gCj4gPiA+ID4gVGhpcyBpbmNsdWRlIHVuYmluZCBlcnJvciBmaXgsIGNsb2NrIGNvbnRyb2wg
ZmxvdyByZWZpbmVtZW50LCBhbmQgUFJJTUUKPiA+ID4gPiBtbWFwIHdpdGggcGFnZSBvZmZzZXQu
Cj4gPiA+ID4gCj4gPiA+ID4gUmVnYXJkcywKPiA+ID4gPiBDSwo+ID4gPiA+IAo+ID4gPiA+IFRo
ZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQKPiA+ID4gPiBhMTg4MzM5Y2E1YTM5NmFj
YzU4OGU1ODUxZWQ3ZTE5ZjY2YjBlYmQ5Ogo+ID4gPiA+IAo+ID4gPiA+ICAgTGludXggNS4yLXJj
MSAoMjAxOS0wNS0xOSAxNTo0NzowOSAtMDcwMCkKPiA+ID4gPiAKPiA+ID4gPiBhcmUgYXZhaWxh
YmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKPiA+ID4gPiAKPiA+ID4gPiAgIGh0dHBzOi8v
Z2l0aHViLmNvbS9ja2h1LW1lZGlhdGVrL2xpbnV4LmdpdC10YWdzLmdpdAo+ID4gPiA+IG1lZGlh
dGVrLWRybS1maXhlcy01LjIKPiA+ID4gCj4gPiA+IEZvciBuZXh0IHRpbWUgYXJvdW5kLCBwbGVh
c2UgbWFrZSB0aGlzIGEgc2lnbmVkIGFubm90YXRlZCB0YWcuIGFubm90YXRlZAo+ID4gPiBiZWNh
dXNlIHRoZW4gaXQncyBsZXNzIHR5cGluZyBmb3IgbWUsIGFuZCBzaWduZWQgYmVjYXVzZSBpdCdz
IG9uIGEgc2VydmVyCj4gPiA+IHdlIGRvbid0IG5lY2Vzc2FyaWx5IHRydXN0Lgo+ID4gCj4gPiBP
SywgSSdkIG1ha2UgYSBzaWduZWQgYW5ub3RhdGVkIHRhZyBpbiBuZXh0IHRpbWUuCj4gPiAKPiA+
ID4gCj4gPiA+ID4gCj4gPiA+ID4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDI0NThk
OWQ2ZDk0YmU5ODJiOTE3ZTkzYzYxYTg5YjQ0MjZmMzJlMzE6Cj4gPiA+ID4gCj4gPiA+ID4gICBk
cm0vbWVkaWF0ZWs6IGNhbGwgbXRrX2RzaV9zdG9wKCkgYWZ0ZXIgbXRrX2RybV9jcnRjX2F0b21p
Y19kaXNhYmxlKCkKPiA+ID4gPiAoMjAxOS0wNi0wNCAwOTo1NDo0MiArMDgwMCkKPiA+ID4gPiAK
PiA+ID4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCj4gPiA+ID4gSHNpbi1ZaSBXYW5nICg1KToKPiA+ID4gPiAgICAgICBk
cm0vbWVkaWF0ZWs6IGZpeCB1bmJpbmQgZnVuY3Rpb25zCj4gPiA+ID4gICAgICAgZHJtL21lZGlh
dGVrOiB1bmJpbmQgY29tcG9uZW50cyBpbiBtdGtfZHJtX3VuYmluZCgpCj4gPiA+ID4gICAgICAg
ZHJtL21lZGlhdGVrOiBjYWxsIGRybV9hdG9taWNfaGVscGVyX3NodXRkb3duKCkgd2hlbiB1bmJp
bmRpbmcKPiA+ID4gPiBkcml2ZXIKPiA+ID4gPiAgICAgICBkcm0vbWVkaWF0ZWs6IGNsZWFyIG51
bV9waXBlcyB3aGVuIHVuYmluZCBkcml2ZXIKPiA+ID4gPiAgICAgICBkcm0vbWVkaWF0ZWs6IGNh
bGwgbXRrX2RzaV9zdG9wKCkgYWZ0ZXIKPiA+ID4gPiBtdGtfZHJtX2NydGNfYXRvbWljX2Rpc2Fi
bGUoKQo+ID4gPiA+IAo+ID4gPiA+IFlvbmdxaWFuZyBOaXUgKDIpOgo+ID4gPiA+ICAgICAgIGRy
bS9tZWRpYXRlazogYWRqdXN0IGRkcCBjbG9jayBjb250cm9sIGZsb3cKPiA+ID4gPiAgICAgICBk
cm0vbWVkaWF0ZWs6IHJlc3BlY3QgcGFnZSBvZmZzZXQgZm9yIFBSSU1FIG1tYXAgY2FsbHMKPiA+
ID4gCj4gPiA+IFlvdSBtaWdodCB3YW50IHRvIGxvb2sgaW50byBhbGwgdGhlIHJlY2VudGx5IGFk
ZGVkIGhlbHBlcnMgZm9yIG1tYXAsIEkKPiA+ID4gZG9uJ3QgdGhpbmsgbXRrIGRvZXMgYW55dGhp
bmcgc3BlY2lhbCBoZXJlLgo+ID4gCj4gPiBJZiB5b3UgbWVhbiB1c2luZyBkcm1fZ2VtX3ByaW1l
X21tYXAgYXMgdGhlIGltcGxlbWVudGF0aW9uIG9mCj4gPiBkcm1fZHJpdmVyLT5nZW1fcHJpbWVf
bW1hcCwgSSB0aGluayB3ZSBoYXZlIGRpc2N1c3NlZCBpbiBbMV0gdGhhdAo+ID4gbWVkaWF0ZWsg
ZHJtIHN0aWxsIG5lZWQgaXRzIG93biBpbXBsZW1lbnRhdGlvbi4KPiA+IAo+ID4gWzFdIGh0dHBz
Oi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTA2NTcwMDcvCj4gCj4gWWVhaCBmb3IgcmV1
c2luZyB0aGUgb3ZlcmFsbCBoZWxwZXJzIHRoYXQncyBjbGVhciwgYnV0Cj4gZHJtX2dlbV9wcmlt
ZV9nZW1fbW1hcCBzaG91bGQgd29yayBmb3IgYW55IGdlbSBiYXNlZCBkcml2ZXIuIEl0IGRvZXNu
J3QKPiByZXF1aXJlIHlvdSB0byB1c2Ugc3BlY2lmaWMgaGVscGVycyBhdCBhbGwuCj4gCj4gSSdt
IHdvbmRlcmluZyBhYm91dCB0aGlzIHNpbmNlIEknbSBsb29raW5nIHJpZ2h0IG5vdyBpbnRvIHRo
aXMgYXJlYSwgYW5kCj4gaXQgbG9va3MgbGlrZSB3ZSBjb3VsZCBqdXN0IG1ha2UgZHJtX2dlbV9w
cmltZV9tbWFwIHRoZSBkZWZhdWx0IGFuZCByaXAKPiBvdXQgYWxsIHRoZSBjdXN0b20gZHJpdmVy
IGltcGxlbWVudGF0aW9ucy4KCk9LLCBJIGZpbmQgdGhhdCBkcm1fZ2VtX3ByaW1lX21tYXAoKSBj
YWxsIGRyaXZlci0+Zm9wcy0+bW1hcCgpLCBzbyB0aGUKY3VzdG9taXphdGlvbiBjb3VsZCBiZSBk
b25lIGluIGRyaXZlci0+Zm9wcy0+bW1hcCBhbmQgbGV0CmRybV9kcml2ZXIuZ2VtX3ByaW1lX21t
YXAgdG8gYmUgZHJtX2dlbV9wcmltZV9tbWFwLiBJIHdvdWxkIHRyeSB0byBkbwpzby4KClJlZ2Fy
ZHMsCkNLCgo+IC1EYW5pZWwKPiAKPiA+IAo+ID4gUmVnYXJkcywKPiA+IENLCj4gPiAKPiA+ID4g
Cj4gPiA+IAo+ID4gPiA+IAo+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Ry
bV9jcnRjLmMgfCAzMAo+ID4gPiA+ICsrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4g
PiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyAgfCAgOCArKystLS0t
LQo+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9nZW0uYyAgfCAgNyAr
KysrKystCj4gPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgICAgICB8
IDEyICsrKysrKysrKysrLQo+ID4gPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDI2IGluc2VydGlvbnMo
KyksIDMxIGRlbGV0aW9ucygtKQo+ID4gPiAKPiA+ID4gUHVsbGVkLCB0aGFua3MuCj4gPiA+IC1E
YW5pZWwKPiA+ID4gCj4gPiA+ID4gCj4gPiA+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiA+ID4gPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPiA+
ID4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gPiA+IGh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCj4gPiA+IAo+ID4gCj4g
PiAKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
