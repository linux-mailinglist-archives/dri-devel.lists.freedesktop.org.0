Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCF2155CA0
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 18:10:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 615E66E0BC;
	Fri,  7 Feb 2020 17:10:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D0DDD6E0DA
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 17:10:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5BB661FB;
 Fri,  7 Feb 2020 09:10:27 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3AE013F68E;
 Fri,  7 Feb 2020 09:10:27 -0800 (PST)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id ECD17682F37; Fri,  7 Feb 2020 17:10:25 +0000 (GMT)
Date: Fri, 7 Feb 2020 17:10:25 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCHv5 00/34] Add AFBC support for Rockchip
Message-ID: <20200207171025.GO1626@e110455-lin.cambridge.arm.com>
References: <20191213173350.GJ624164@phenom.ffwll.local>
 <20191217145020.14645-1-andrzej.p@collabora.com>
 <abace7b9-388b-e161-3371-c3b2e5406ff5@collabora.com>
 <de033b8f-756c-a6ea-106e-bfbb480cc354@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <de033b8f-756c-a6ea-106e-bfbb480cc354@collabora.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: kernel@collabora.com, Mihail Atanassov <mihail.atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, James Wang <james.qian.wang@arm.com>,
 Ayan Halder <Ayan.Halder@arm.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBGZWIgMDcsIDIwMjAgYXQgMTI6NDQ6MjhQTSArMDEwMCwgQW5kcnplaiBQaWV0cmFz
aWV3aWN6IHdyb3RlOgo+IEhpIEFsbCBhZ2FpbiwKCkhpIEFuZHJ6ZWosCgo+IAo+IEBtYWxpZHAg
YW5kIGtvbWVkYSBmb2xrczogSSBraW5kbHkgYXNrIHlvdSB0byBoYXZlIHlvdXIgc2F5LiBJZiB0
aGVyZSBpcwo+IG5vIGludGVyZXN0IGZyb20geW91ICh3aGljaCBpcyBvayB3aXRoIG1lKSBJIHdp
bGwgcmVzZW5kIHRoZSBzZXJpZXMKPiBkcm9wcGluZyB0aGUga29tZWRhIGFuZCBtYWxpZHAgcGFy
dC4KCkkgKmFtKiB0cnlpbmcgdG8gdGVzdCB5b3VyIHBhdGNoZXMsIHVuZm9ydHVuYXRlbHkgbXkg
Y29sbGVhZ3VlcyBpbiBDaGluYSBoYXZlIGJlZW4Ka2VwdCBvdXQgb2YgdGhlIG9mZmljZSBmb3Ig
bG9uZ2VyIHRoYW4gSSB0aG91Z2h0IHRoZXkgd2lsbCwgc28gaXQgaXMgYSBiaXQgZGlmZmljdWx0
CnRvIGNvb3JkaW5hdGUuCgpBcyBhIGJhY2t1cCwgaWYgSSBkb24ndCBtYW5hZ2UgdG8gZ2l2ZSB5
b3UgZmVlZGJhY2sgYnkgZW5kIG9mIFR1ZXNkYXksIHBsZWFzZSByZS1zZW5kCnRoZSBwYXRjaGVz
IHdpdGggbWFsaWRwIGFuZCByb2NrY2hpcCBhbmQgc2tpcCB0aGUga29tZWRhIG9uZXMuCgpCZXN0
IHJlZ2FyZHMsCkxpdml1Cgo+IAo+IEFuZHJ6ZWoKPiAKPiBXIGRuaXUgMzAuMDEuMjAyMCBvwqAx
MDowOCwgQW5kcnplaiBQaWV0cmFzaWV3aWN6IHBpc3plOgo+ID4gSGkgQWxsLAo+ID4gCj4gPiBB
IGdlbnRsZSByZW1pbmRlci4KPiA+IAo+ID4gUGxlYXNlIGFsc28gc2VlIGlubGluZToKPiA+IAo+
ID4gVyBkbml1IDE3LjEyLjIwMTkgb8KgMTU6NDksIEFuZHJ6ZWogUGlldHJhc2lld2ljeiBwaXN6
ZToKPiA+ID4gVGhpcyBzZXJpZXMgYWRkcyBBRkJDIHN1cHBvcnQgZm9yIFJvY2tjaGlwLiBJdCBp
cyBpbnNwaXJlZCBieToKPiA+ID4gCj4gPiA+IGh0dHBzOi8vY2hyb21pdW0uZ29vZ2xlc291cmNl
LmNvbS9jaHJvbWl1bW9zL3RoaXJkX3BhcnR5L2tlcm5lbC8rL3JlZnMvaGVhZHMvZmFjdG9yeS1n
cnUtOTAxNy5CLWNocm9tZW9zLTQuNC9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBf
ZHJtX3ZvcC5jCj4gPiA+IAo+ID4gPiAKPiA+ID4gVGhpcyBpcyB0aGUgZmlmdGggaXRlcmF0aW9u
IG9mIHRoZSBhZmJjIHNlcmllcy4gQmV0d2VlbiB2MyBhbmQgdjQgYSBsb3Qgb2YKPiA+ID4gcmV3
b3JrIGhhcyBiZWVuIGRvbmUsIHRoZSBtYWluIGdvYWwgb2Ygd2hpY2ggd2FzIHRvIG1vdmUgYWxs
IGFmYmMtcmVsYXRlZAo+ID4gPiBjaGVja3MgdG8gaGVscGVycywgc28gdGhhdCBjb3JlIGRvZXMg
bm90IGRlYWwgd2l0aCBpdC4KPiA+ID4gCj4gPiA+IEEgbmV3IHN0cnVjdCBkcm1fYWZiY19mcmFt
ZWJ1ZmZlciBpcyBhZGRlZCwgd2hpY2ggc3RvcmVzIGFmYmMtcmVsYXRlZAo+ID4gPiBkcml2ZXIt
c3BlY2lmaWMgZGF0YS4gQmVjYXVzZSBvZiB0aGF0LCBpbiBkcml2ZXJzIHRoYXQgd2lzaCB0bwo+
ID4gPiB1c2UgdGhpcyBmZWF0dXJlLCB0aGUgc3RydWN0IG11c3QgYmUgYWxsb2NhdGVkIGRpcmVj
dGx5IGluIHRoZSBkcml2ZXIKPiA+ID4gY29kZSByYXRoZXIgdGhhbiBpbnNpZGUgaGVscGVycywg
c28gdGhlIGZpcnN0IHBvcnRpb24gb2YgdGhlIHBhdGNoc2V0Cj4gPiA+IGRvZXMgdGhlIG5lY2Vz
c2FyeSByZWZhY3RvcmluZy4KPiA+ID4gCj4gPiA+IFRoZW4sIHRoZXJlIGFyZSAzIHVzZXJzIG9m
IGFmYmM6IGtvbWVkYSwgbWFsaWRwIGFuZCwgZmluYWxseSwgcm9ja2NoaXAsCj4gPiA+IHRoZSBs
YXR0ZXIgYmVpbmcgdGhlIHVsdGltYXRlIHB1cnBvc2Ugb2YgdGhpcyB3b3JrIGFuZCB0aGUgMyBz
dWJzZXF1ZW50Cj4gPiA+IHBvcnRpb25zIG9mIHRoZSBwYXRjaHNldCBtb3ZlIGtvbWVkYSBhbmQg
bWFsaWRwIHRvIGdlbmVyaWMgaGVscGVycyBhbmQgYWRkCj4gPiA+IGFmYmMgc3VwcG9ydCB0byBy
b2NrY2hpcC4KPiA+IAo+ID4gSWYgY2hhbmdlcyBpbiBrb21lZGEgYW5kIG1hbGlkcCBpcyB0b28g
bXVjaCB0byBkaWdlc3QgYXQgYSB0aW1lIEkgY2FuCj4gPiBmb2N1cyBvbiByb2NrY2hpcCBvbmx5
LiBUaGlzIHdvdWxkIGFtb3VudCB0byBwYXRjaGVzIDEtNCBhbmQgMzMtMzQuCj4gPiBBZnRlciBh
bGwgdGhlIHVsdGltYXRlIHB1cnBvc2Ugb2YgdGhpcyB3b3JrIGFuZCB0aW1lIHNwZW50IG9uIGl0
Cj4gPiBpcyBsYW5kaW5nIGFmYmMgc3VwcG9ydCBmb3Igcm9ja2NoaXAuCj4gPiAKPiA+IFJlZ2Fy
ZHMsCj4gPiAKPiA+IEFuZHJ6ZWoKPiAKCi0tIAo9PT09PT09PT09PT09PT09PT09PQp8IEkgd291
bGQgbGlrZSB0byB8CnwgZml4IHRoZSB3b3JsZCwgIHwKfCBidXQgdGhleSdyZSBub3QgfAp8IGdp
dmluZyBtZSB0aGUgICB8CiBcIHNvdXJjZSBjb2RlISAgLwogIC0tLS0tLS0tLS0tLS0tLQogICAg
wq9cXyjjg4QpXy/CrwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
