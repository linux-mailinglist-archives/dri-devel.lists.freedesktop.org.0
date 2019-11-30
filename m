Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0DB10DE8F
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2019 19:35:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F04189DFB;
	Sat, 30 Nov 2019 18:35:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 647E989DFB
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2019 18:35:51 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 6B3198062D;
 Sat, 30 Nov 2019 19:35:49 +0100 (CET)
Date: Sat, 30 Nov 2019 19:35:48 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 2/3] dt-bindings: panel: Document Frida FRD350H54004 LCD
 panel
Message-ID: <20191130183548.GC24722@ravnborg.org>
References: <20191120171027.1102250-1-paul@crapouillou.net>
 <20191120171027.1102250-2-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191120171027.1102250-2-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=ER_8r6IbAAAA:8
 a=6sA7AJTnC8BI-8blUJYA:9 a=CjuIK1q_8ugA:10 a=9LHmKk7ezEChjTCyhBa9:22
 a=pHzHmUro8NiASowvMSCR:22 a=6VlIyEUom7LUIeUMNQJH:22
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, od@zcrc.me,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUGF1bC4KCk9uIFdlZCwgTm92IDIwLCAyMDE5IGF0IDA2OjEwOjI2UE0gKzAxMDAsIFBhdWwg
Q2VyY3VlaWwgd3JvdGU6Cj4gQWRkIGJpbmRpbmdzIGRvY3VtZW50YXRpb24gZm9yIHRoZSBGcmlk
YSAzLjUiICgzMjB4MjQwIHBpeGVscykgMjQtYml0Cj4gVEZUIExDRCBwYW5lbC4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBvdWlsbG91Lm5ldD4KPiAtLS0KPiAg
Li4uL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvZnJpZGEsZnJkMzUwaDU0MDA0LnR4dCAgICB8IDEy
ICsrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQo+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
cGFuZWwvZnJpZGEsZnJkMzUwaDU0MDA0LnR4dAo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9mcmlkYSxmcmQzNTBoNTQwMDQu
dHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvZnJp
ZGEsZnJkMzUwaDU0MDA0LnR4dAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAw
MDAwMDAwLi44NDI4ZjhiMDViOTMKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvZnJpZGEsZnJkMzUwaDU0MDA0LnR4
dAo+IEBAIC0wLDAgKzEsMTIgQEAKPiArRnJpZGEgMy41IiAoMzIweDI0MCBwaXhlbHMpIDI0LWJp
dCBURlQgTENEIHBhbmVsCj4gKwo+ICtSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ICstIGNvbXBhdGli
bGU6IHNob3VsZCBiZSAiZnJpZGEsZnJkMzUwaDU0MDA0Igo+ICstIHBvd2VyLXN1cHBseTogYXMg
c3BlY2lmaWVkIGluIHRoZSBiYXNlIGJpbmRpbmcKPiArCj4gK09wdGlvbmFsIHByb3BlcnRpZXM6
Cj4gKy0gYmFja2xpZ2h0OiBhcyBzcGVjaWZpZWQgaW4gdGhlIGJhc2UgYmluZGluZwo+ICstIGVu
YWJsZS1ncGlvczogYXMgc3BlY2lmaWVkIGluIHRoZSBiYXNlIGJpbmRpbmcKPiArCj4gK1RoaXMg
YmluZGluZyBpcyBjb21wYXRpYmxlIHdpdGggdGhlIHNpbXBsZS1wYW5lbCBiaW5kaW5nLCB3aGlj
aCBpcyBzcGVjaWZpZWQKPiAraW4gc2ltcGxlLXBhbmVsLnR4dCBpbiB0aGlzIGRpcmVjdG9yeS4K
Ck5ldyBiaW5kaW5ncyBpbiBtZXRhLXNjaG1hICh5YW1sKSBmb3JtYXQgb25seS4KV2UgYXJlIG1p
Z3JhdGluZyBhd2F5IGZyb20gdGhlIC50eHQgYmFzZWQgdmFyaWFudHMuCgpSb2IgaGFzIGEgbWVn
YSBwYXRjaCBzbyB3ZSB3aWxsIHNvb24gaGF2ZSBhIGxvdCBvZiBleGFtcGxlcyB0byBsb29rIGF0
LgoKCVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
