Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC8E20F19
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 21:13:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8941489622;
	Thu, 16 May 2019 19:13:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40873896DD
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 19:13:53 +0000 (UTC)
Received: from ip5f5a6320.dynamic.kabel-deutschland.de ([95.90.99.32]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1hRLp8-0006bY-3u; Thu, 16 May 2019 21:13:50 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 00/12]  drm: Add self refresh helpers
Date: Thu, 16 May 2019 21:13:49 +0200
Message-ID: <1660896.Nq8jYQT4Eu@diego>
In-Reply-To: <20190508160920.144739-1-sean@poorly.run>
References: <20190508160920.144739-1-sean@poorly.run>
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
Cc: Sean Paul <seanpaul@chromium.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gTWl0dHdvY2gsIDguIE1haSAyMDE5LCAxODowOTowNSBDRVNUIHNjaHJpZWIgU2VhbiBQYXVs
Ogo+IEZyb206IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+IAo+IEFub3RoZXIg
dmVyc2lvbiBvZiB0aGUgU1IgaGVscGVycyBmb3IgeW91ciBjb25zdW1wdGlvbi4KPiAKPiBQcmV0
dHkgbWlub3IgZGlmZmVyZW5jZXMgYmV0d2VlbiB2NCBhbmQgdjM6Cj4gLSBsb3RzIG9mIGRvY3Vt
ZW50YXRpb24gY2hhbmdlcwo+IC0gVXNlIGNvbm5lY3RvciB0byBnZXQgYXQgY3J0YyBzdGF0ZSBp
biBlbmNvZGVycwo+IC0gVXNlIHRoZSBkYW1hZ2UgaGVscGVycyBpbiByb2NrY2hpcCB0byBmaXgg
ZmJkZXYKPiAKPiBOb3RlIHRoYXQgdGhlIHJvY2tjaGlwIHBhdGNoZXMgcmVxdWlyZQo+IGU5YWJj
NjExYTk0MWQ0MDUxY2RlMWQ5NGIyYWI3NDczZmRiNTAxMDIgd2hpY2ggaXMgbWFraW5nIGl0cyB3
YXkgdGhyb3VnaAo+IHRoZSAtZml4ZXMgYnJhbmNoZXMuCj4gCj4gUFRBTAo+IAo+IExhdXJlbnQg
UGluY2hhcnQgKDEpOgo+ICAgZHJtOiBBZGQgZHJtX2F0b21pY19nZXRfKG9sZHxuZXctX2Nvbm5l
Y3Rvcl9mb3JfZW5jb2RlcigpIGhlbHBlcnMKPiAKPiBTZWFuIFBhdWwgKDEwKToKPiAgIGRybTog
QWRkIGF0b21pYyB2YXJpYW50cyBvZiBlbmFibGUvZGlzYWJsZSB0byBlbmNvZGVyIGhlbHBlciBm
dW5jcwo+ICAgZHJtOiBBZGQgYXRvbWljIHZhcmlhbnRzIGZvciBicmlkZ2UgZW5hYmxlL2Rpc2Fi
bGUKPiAgIGRybTogQ29udmVydCBjb25uZWN0b3JfaGVscGVyX2Z1bmNzLT5hdG9taWNfY2hlY2sg
dG8gYWNjZXB0Cj4gICAgIGRybV9hdG9taWNfc3RhdGUKPiAgIGRybTogQWRkIGhlbHBlcnMgdG8g
a2ljayBvZmYgc2VsZiByZWZyZXNoIG1vZGUgaW4gZHJpdmVycwo+ICAgZHJtL3JvY2tjaGlwOiBV
c2UgZGlydHlmYiBoZWxwZXIKPiAgIGRybS9yb2NrY2hpcDogQ2hlY2sgZm9yIGZhc3QgbGluayB0
cmFpbmluZyBiZWZvcmUgZW5hYmxpbmcgcHNyCj4gICBkcm0vcm9ja2NoaXA6IFVzZSB0aGUgaGVs
cGVycyBmb3IgUFNSCj4gICBkcm0vcm9ja2NoaXA6IFVzZSB2b3Bfd2luIGluIHZvcF93aW5fZGlz
YWJsZSBpbnN0ZWFkIG9mIHZvcF93aW5fZGF0YQo+ICAgZHJtL3JvY2tjaGlwOiBEb24ndCBmdWxs
eSBkaXNhYmxlIHZvcCBvbiBzZWxmIHJlZnJlc2gKPiAgIGRybS9yb2NrY2hpcDogVXNlIGRybV9h
dG9taWNfaGVscGVyX2NvbW1pdF90YWlsX3JwbQoKd2hvbGUgc2VyaWVzIApvbglyazMzOTktZ3J1
LWtldmluIChhbmFsb2dpeC1kcCB3aXRoIHBzciksCglyazMyODgtdmV5cm9uLXBpbmt5IChhbmFs
b2dpeC1kcCB3aXRob3V0IHBzciArIGR3X2hkbWkpCgpUZXN0ZWQtYnk6IEhlaWtvIFN0dWVibmVy
IDxoZWlrb0BzbnRlY2guZGU+CgpQYXRjaDIgaGFkIGEgdGlueSBiaXQgb2YgaXNzdWUgd2hlbiB0
cnlpbmcgdG8gYXBwbHkgKHN1cnJvdW5kaW5nIGNvZGUKc2VlbXMgdG8gaGF2ZSBjaGFuZ2VkKSwg
YnV0IGFsbCBkaXNwbGF5IHN0dWZmIHNlZW1zIHRvIGtlZXAgd29ya2luZywKaW5jbHVkaW5nIHRo
ZSBibGlua2luZyBjdXJzb3Igb24gdGhlIHBzciBkaXNwbGF5IDotKSAuCgoKVGhhbmtzCkhlaWtv
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
