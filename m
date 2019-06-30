Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2B25B16E
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 22:03:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D1289DA2;
	Sun, 30 Jun 2019 20:03:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17A889DA2
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2019 20:03:06 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id CCB2680426;
 Sun, 30 Jun 2019 22:03:01 +0200 (CEST)
Date: Sun, 30 Jun 2019 22:02:59 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 1/7] dt-bindings: Add panel-timing subnode to
 simple-panel
Message-ID: <20190630200259.GA15102@ravnborg.org>
References: <20190401171724.215780-1-dianders@chromium.org>
 <20190401171724.215780-2-dianders@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190401171724.215780-2-dianders@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=cm27Pg_UAAAA:8
 a=-VAfIpHNAAAA:8 a=s8YR1HE3AAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=e5mUnYsNAAAA:8 a=JfrnYn6hAAAA:8 a=rQ-KyBzUA4MiSMEBMPUA:9
 a=wPNLvfGTeEIA:10 a=xmb-EsYY8bH0VWELuYED:22 a=srlwD-8ojaedGGhPAyx8:22
 a=jGH_LyMDp9YhSvY-UuyI:22 a=AjGcO6oz07-iQ99wixmX:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=1CNFftbPRP8L7MoqJWF3:22
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Jeffy Chen <jeffy.chen@rock-chips.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-rockchip@lists.infradead.org, Thierry Reding <thierry.reding@gmail.com>,
 Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Enric =?iso-8859-1?Q?Balletb=F2?= <enric.balletbo@collabora.com>,
 =?iso-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
 Ezequiel Garcia <ezequiel@collabora.com>, mka@chromium.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRG91Z2xhcy4KClNvbWUgbG9uZyBvdmVyZHVlIHJldmlldyBmZWVkYmFjay4KCk9uIE1vbiwg
QXByIDAxLCAyMDE5IGF0IDEwOjE3OjE4QU0gLTA3MDAsIERvdWdsYXMgQW5kZXJzb24gd3JvdGU6
Cj4gRnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+Cj4gCj4gVGhpcyBwYXRj
aCBhZGRzIGEgbmV3IHN1Ym5vZGUgdG8gc2ltcGxlLXBhbmVsIGFsbG93aW5nIHVzIHRvIG92ZXJy
aWRlCj4gdGhlIHR5cGljYWwgdGltaW5nIGV4cHJlc3NlZCBpbiB0aGUgcGFuZWwncyBkaXNwbGF5
X3RpbWluZy4KPiAKPiBDaGFuZ2VzIGluIHYyOgo+ICAtIFNwbGl0IG91dCB0aGUgYmluZGluZyBp
bnRvIGEgbmV3IHBhdGNoIChSb2IpCj4gIC0gZGlzcGxheS10aW1pbmdzIGlzIGEgbmV3IHNlY3Rp
b24gKFJvYikKPiAgLSBVc2UgdGhlIGZ1bGwgZGlzcGxheS10aW1pbmdzIHN1Ym5vZGUgaW5zdGVh
ZCBvZiBwaWNraW5nIHRoZSB0aW1pbmcKPiAgICBvdXQgKFJvYi9UaGllcnJ5KQo+IENoYW5nZXMg
aW4gdjM6Cj4gIC0gR28gYmFjayB0byB1c2luZyB0aGUgdGltaW5nIHN1Ym5vZGUgZGlyZWN0bHks
IGJ1dCByZW5hbWUgdG8KPiAgICBwYW5lbC10aW1pbmcgKFJvYikKPiBDaGFuZ2VzIGluIHY0Ogo+
ICAtIFNpbXBsaWZ5IGRlc2MuIGZvciB3aGVuIG92ZXJyaWRlIHNob3VsZCBiZSB1c2VkIChUaGll
cnJ5L0xhdXJlbnQpCj4gIC0gUmVtb3ZlZCBSb2IgSCByZXZpZXcgc2luY2UgaXQncyBiZWVuIGEg
eWVhciBhbmQgd29yZGluZyBjaGFuZ2VkCj4gQ2hhbmdlcyBpbiB2NToKPiAgLSBSZW1vdmVkIGJp
dCBhYm91dCBPUyBtYXkgaWdub3JlIChSb2IvRXplcXVpZWwpCj4gCj4gQ2M6IERvdWcgQW5kZXJz
b24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4KPiBDYzogRXJpYyBBbmhvbHQgPGVyaWNAYW5ob2x0
Lm5ldD4KPiBDYzogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4KPiBDYzogSmVmZnkg
Q2hlbiA8amVmZnkuY2hlbkByb2NrLWNoaXBzLmNvbT4KPiBDYzogUm9iIEhlcnJpbmcgPHJvYmgr
ZHRAa2VybmVsLm9yZz4KPiBDYzogU3TDqXBoYW5lIE1hcmNoZXNpbiA8bWFyY2hldUBjaHJvbWl1
bS5vcmc+Cj4gQ2M6IFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+Cj4g
Q2M6IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKPiBDYzogbGludXgtcm9ja2NoaXBAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IFNp
Z25lZC1vZmYtYnk6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+IFNpZ25lZC1v
ZmYtYnk6IERvdWdsYXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4KPiAtLS0KPiAK
PiAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvc2ltcGxlLXBhbmVsLnR4dCAgIHwgMjIgKysr
KysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKQo+IAo+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9w
YW5lbC9zaW1wbGUtcGFuZWwudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvcGFuZWwvc2ltcGxlLXBhbmVsLnR4dAo+IGluZGV4IGIyYjg3MmM3MTBmMi4uOTM4
ODIyNjhjMGI5IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L3BhbmVsL3NpbXBsZS1wYW5lbC50eHQKPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9zaW1wbGUtcGFuZWwudHh0Cj4gQEAgLTE1
LDYgKzE1LDE2IEBAIE9wdGlvbmFsIHByb3BlcnRpZXM6Cj4gICAgKGhvdCBwbHVnIGRldGVjdCkg
c2lnbmFsLCBidXQgdGhlIHNpZ25hbCBpc24ndCBob29rZWQgdXAgc28gd2Ugc2hvdWxkCj4gICAg
aGFyZGNvZGUgdGhlIG1heCBkZWxheSBmcm9tIHRoZSBwYW5lbCBzcGVjIHdoZW4gcG93ZXJpbmcg
dXAgdGhlIHBhbmVsLgo+ICAKPiArcGFuZWwtdGltaW5nIHN1Ym5vZGUKPiArLS0tLS0tLS0tLS0t
LS0tLS0tLS0KPiArCj4gK1RoaXMgb3B0aW9uYWwgc3Vibm9kZSBpcyBmb3IgZGV2aWNlcyB3aGlj
aCByZXF1aXJlIGEgbW9kZSBkaWZmZXJpbmcKPiArZnJvbSB0aGUgcGFuZWwncyAidHlwaWNhbCIg
ZGlzcGxheSB0aW1pbmcuCk1leWJlIGFkZCBoZXJlIHRoYXQgaXQgaXMgZXhwZWN0ZWQgdGhhdCB0
aGUgcGFuZWwgaGFzIGluY2x1ZGVkIHRpbWluZwppbiB0aGUgZHJpdmVyIGl0c2VsZiwgYW5kIG5v
dCBhcyBwYXJ0IG9mIERULgpTbyB3aGF0IGlzIHNwZWNpZmllZCBoZXJlIGlzIGEgbW9yZSBwcmVj
aXNlIHZhcmlhbnQsIHdpdGhpbiB0aGUgbGltaXRzCm9mIHdoYXQgaXMgc3BlY2lmaWVkIGZvciB0
aGUgcGFuZWwuCgo+ICsKPiArRm9ybWF0IGluZm9ybWF0aW9uIG9uIHRoZSBwYW5lbC10aW1pbmcg
c3Vibm9kZSBjYW4gYmUgZm91bmQgaW4KPiArZGlzcGxheS10aW1pbmcudHh0LgpkaXNwbGF5LXRp
bWluZyBkZWZpbmVzIG90aW9uYWwgcHJvcGVydGllczoKaHN5bmMtYWN0aXZlLCBwaXhlbGNsay1h
Y3RpdmUsIGRvdWJsZXNjYW4gZXRjLgpJdCBpcyBub3QgZnJvbSB0aGUgYWJvdmUgb2J2aW91cyB3
aGljaCBwcm9wZXJ0aWVzIGZyb20gZGlzcGxheS10aW1pbmdzCnRoYXQgY2FuIGJlIHNwZWNpZmll
ZCBmb3IgYSBwYW5lbC10aW1pbmcgc3ViLW5vZGUuCk1heWJlIGJlY2F1c2UgdGhleSBjYW4gYWxs
IGJlIHNwZWNpZmllZD8KCkRpc3BsYXktdGltaW5nIGFsbG93cyB0aW1pbmdzIHRvIGJlIHNwZWNp
ZmllZCBhcyBhIHJhbmdlLgpJZiBpdCBpcyBhbHNvIE9LIHRvIHNwZWNpZnkgYSByYW5nZSBmb3Ig
cGFubGUtdGltaW5nIHRoZW4gZXZlcnl0aGlnbiBpcwpmaW5lLiBCdXQgaWYgdGhlIHBhbmVsLXRp
bWlnbiBzdWJub2RlIGRvIG5vdCBhbGxvdyByYW5nZXMgdGhpcyBuZWVkcyB0bwpiZSBzcGVjaWZp
ZWQuCgo+ICsKPiArCj4gIEV4YW1wbGU6Cj4gIAo+ICAJcGFuZWw6IHBhbmVsIHsKPiBAQCAtMjUs
NCArMzUsMTYgQEAgRXhhbXBsZToKPiAgCQllbmFibGUtZ3Bpb3MgPSA8JmdwaW8gOTAgMD47Cj4g
IAo+ICAJCWJhY2tsaWdodCA9IDwmYmFja2xpZ2h0PjsKPiArCj4gKwkJcGFuZWwtdGltaW5nIHsK
PiArCQkJY2xvY2stZnJlcXVlbmN5ID0gPDI2NjYwNDcyMD47Cj4gKwkJCWhhY3RpdmUgPSA8MjQw
MD47Cj4gKwkJCWhmcm9udC1wb3JjaCA9IDw0OD47Cj4gKwkJCWhiYWNrLXBvcmNoID0gPDg0PjsK
PiArCQkJaHN5bmMtbGVuID0gPDMyPjsKPiArCQkJdmFjdGl2ZSA9IDwxNjAwPjsKPiArCQkJdmZy
b250LXBvcmNoID0gPDM+Owo+ICsJCQl2YmFjay1wb3JjaCA9IDwxMjA+Owo+ICsJCQl2c3luYy1s
ZW4gPSA8MTA+Owo+ICsJCX07Cj4gIAl9Owo+IC0tIAo+IDIuMjEuMC4zOTIuZ2Y4ZjY3ODcxNTll
LWdvb2cKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
