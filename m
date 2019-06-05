Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF56A36693
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 23:16:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AFDF8930E;
	Wed,  5 Jun 2019 21:16:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14EF78930E
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 21:16:52 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 3F0A82011B;
 Wed,  5 Jun 2019 23:16:50 +0200 (CEST)
Date: Wed, 5 Jun 2019 23:16:48 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Josef Lusticky <josef@lusticky.cz>
Subject: Re: [PATCH 2/2] dt-bindings: panel: Add Ilitek ILI9341 panel
 documentation
Message-ID: <20190605211648.GA2348@ravnborg.org>
References: <20190219132101.27196-1-josef@lusticky.cz>
 <20190219132101.27196-3-josef@lusticky.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190219132101.27196-3-josef@lusticky.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=e5mUnYsNAAAA:8 a=GOHkJZeNjhEJBjOU3QsA:9 a=CjuIK1q_8ugA:10
 a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSm9zZWYuCgpQbGVhc2UgZm9sbG93IGd1aWRlbGluZXMgaW4KRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3N1Ym1pdHRpbmcuLi4KCllvdSB3aWxsIGFtb25nIG90aGVyIGxlYXJu
IHRvIHNlbmQgdGhpcyBwYXRjaCB0byB0aGUgcmlnaHQgbWFpbGluZyBsaXN0LgpBbmQgcGxlYXNl
IGFkZCBhIHNob3J0IHN1bW1hcnkgaW4gdGhlIGNoYW5nZWxvZyBib2R5LgpUaGUgY2hhbmdlbG9n
IGJvZHkgc2hhbGwgbm90IHJlcXVpcmUgdGhlIHJlYWRlciB0byBydGVhZCBzdWJqZWN0IHRvIGtu
b3cKd2hhdCB0aGUgcGF0Y2ggY29udGFpbnMuCgpJbiBuZXh0IHJldmlzaW9ucywgc2VudCB0byB0
aGUgcmlnaHQgbGlzdCBldGMuIHlvdSBjYW4gYWRkIG15OgoKUmV2aWV3ZWQtYnk6IFNhbSBSYXZu
Ym9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KCgpPbiBUdWUsIEZlYiAxOSwgMjAxOSBhdCAwMjoyMTow
MVBNICswMTAwLCBKb3NlZiBMdXN0aWNreSB3cm90ZToKPiAtLS0KPiAgLi4uL2JpbmRpbmdzL2Rp
c3BsYXkvcGFuZWwvaWxpdGVrLGlsaTkzNDEudHh0IHwgMzMgKysrKysrKysrKysrKysrKysrKwo+
ICAxIGZpbGUgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvaWxpdGVrLGls
aTkzNDEudHh0Cj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L3BhbmVsL2lsaXRlayxpbGk5MzQxLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2lsaXRlayxpbGk5MzQxLnR4dAo+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi40ZTBlNDgzYmMxMmUKPiAtLS0g
L2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvcGFuZWwvaWxpdGVrLGlsaTkzNDEudHh0Cj4gQEAgLTAsMCArMSwzMyBAQAo+ICtJbGl0ZWsg
SUxJOTM0MSBURlQgcGFuZWwgZHJpdmVyIHdpdGggU1BJIGNvbnRyb2wgYnVzCj4gKwo+ICtUaGlz
IGlzIGEgZHJpdmVyIGZvciAyNDB4MzIwIFRGVCBwYW5lbHMgd2l0aCBwYXJhbGxlbCBSR0IgY29s
b3IgaW5wdXQuCj4gKwo+ICtSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ICsgIC0gY29tcGF0aWJsZTog
ImRpc3BsYXl0ZWNoLGR0MDI0Y3RmdCIsICJpbGl0ZWssaWxpOTM0MSIKPiArICAtIGJhY2tsaWdo
dDogcGhhbmRsZSBvZiB0aGUgYmFja2xpZ2h0IGRldmljZSBhdHRhY2hlZCB0byB0aGUgcGFuZWwK
PiArCj4gK09wdGlvbmFsIHByb3BlcnRpZXM6Cj4gKyAgLSBkYy1ncGlvczogYSBHUElPIHNwZWMg
Zm9yIHRoZSBEYXRhL0NvbW1hbmQgcGluLCBzZWUgZ3Bpby9ncGlvLnR4dAo+ICsgIC0gcmVzZXQt
Z3Bpb3M6IGEgR1BJTyBzcGVjIGZvciB0aGUgcmVzZXQgcGluLCBzZWUgZ3Bpby9ncGlvLnR4dAo+
ICsKPiArVGhlIHBhbmVsIG11c3Qgb2JleSB0aGUgcnVsZXMgZm9yIGEgU1BJIHNsYXZlIGRldmlj
ZSBhcyBzcGVjaWZpZWQgaW4KPiArc3BpL3NwaS1idXMudHh0Cj4gKwo+ICtUaGUgZGV2aWNlIG5v
ZGUgY2FuIGNvbnRhaW4gb25lICdwb3J0JyBjaGlsZCBub2RlIHdpdGggb25lIGNoaWxkCj4gKydl
bmRwb2ludCcgbm9kZSwgYWNjb3JkaW5nIHRvIHRoZSBiaW5kaW5ncyBkZWZpbmVkIGluCj4gK21l
ZGlhL3ZpZGVvLWludGVyZmFjZXMudHh0LiBUaGlzIG5vZGUgc2hvdWxkIGRlc2NyaWJlIHBhbmVs
J3MgdmlkZW8gYnVzLgo+ICsKPiArRXhhbXBsZToKPiArCj4gK3BhbmVsQDAgewo+ICsJY29tcGF0
aWJsZSA9ICJkaXNwbGF5dGVjaCxkdDAyNGN0ZnQiLCAiaWxpdGVrLGlsaTkzNDEiOwo+ICsJcmVn
ID0gPDA+Owo+ICsJYmFja2xpZ2h0ID0gPCZiYWNrbGlnaHQ+Owo+ICsJZGMtZ3Bpb3MgPSA8JnBp
byA0IDkgR1BJT19BQ1RJVkVfSElHSD47Cj4gKwo+ICsJcG9ydCB7Cj4gKwkJcGFuZWxfaW46IGVu
ZHBvaW50IHsKPiArCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZkaXNwbGF5X291dD47Cj4gKwkJfTsK
PiArCX07Cj4gK307Cj4gLS0gCj4gMi4yMC4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
