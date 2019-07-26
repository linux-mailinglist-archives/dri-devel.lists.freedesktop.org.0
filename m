Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB77576F4F
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 18:47:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1DCE6EDCA;
	Fri, 26 Jul 2019 16:47:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3BB16EDCA
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 16:47:45 +0000 (UTC)
X-Originating-IP: 109.190.253.11
Received: from localhost (unknown [109.190.253.11])
 (Authenticated sender: maxime.ripard@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 839B91BF207;
 Fri, 26 Jul 2019 16:47:41 +0000 (UTC)
Date: Fri, 26 Jul 2019 18:36:01 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Torsten Duwe <duwe@lst.de>
Subject: Re: [PATCH v3 6a/7] dt-bindings: Add ANX6345 DP/eDP transmitter
 binding
Message-ID: <20190726163601.o32bxqew5xavjgyi@flea>
References: <20190722150414.9F97668B20@verein.lst.de>
 <20190725151829.DC20968B02@verein.lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725151829.DC20968B02@verein.lst.de>
User-Agent: NeoMutt/20180716
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
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vasily Khoruzhick <anarsoul@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Harald Geyer <harald@ccbib.org>, Sean Paul <seanpaul@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBUaHUsIEp1bCAyNSwgMjAxOSBhdCAwNToxODoyOVBNICswMjAwLCBUb3JzdGVuIER1
d2Ugd3JvdGU6Cj4gVGhlIGFueDYzNDUgaXMgYW4gdWx0cmEtbG93IHBvd2VyIERpc3BsYXlQb3J0
L2VEUCB0cmFuc21pdHRlciBkZXNpZ25lZAo+IGZvciBwb3J0YWJsZSBkZXZpY2VzLgo+Cj4gQWRk
IGEgYmluZGluZyBkb2N1bWVudCBmb3IgaXQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBJY2Vub3d5IFpo
ZW5nIDxpY2Vub3d5QGFvc2MuaW8+Cj4gU2lnbmVkLW9mZi1ieTogVmFzaWx5IEtob3J1emhpY2sg
PGFuYXJzb3VsQGdtYWlsLmNvbT4KPiBSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2Vy
bmVsLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBUb3JzdGVuIER1d2UgPGR1d2VAc3VzZS5kZT4KPiBS
ZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9h
cmQuY29tPgo+IC0tLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9h
bng2MzQ1LnlhbWwgfCAgIDkwICsrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDkwIGluc2Vy
dGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9hbng2MzQ1LnlhbWwKPgo+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvYW54NjM0NS55YW1s
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2FueDYz
NDUueWFtbAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi4wYWYw
OTJkMTAxYzUKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2FueDYzNDUueWFtbAo+IEBAIC0wLDAgKzEsOTAgQEAK
PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+ICslWUFNTCAxLjIKPiArLS0t
Cj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvZGlzcGxheS9icmlkZ2UvYW54
NjM0NS55YW1sIwo+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFz
L2NvcmUueWFtbCMKPiArCj4gK3RpdGxlOiBBbmFsb2dpeCBBTlg2MzQ1IGVEUCBUcmFuc21pdHRl
ciBEZXZpY2UgVHJlZSBCaW5kaW5ncwo+ICsKPiArbWFpbnRhaW5lcnM6Cj4gKyAgLSBUb3JzdGVu
IER1d2UgPGR1d2VAbHN0LmRlPgo+ICsKPiArZGVzY3JpcHRpb246IHwKPiArICBUaGUgQU5YNjM0
NSBpcyBhbiB1bHRyYS1sb3cgcG93ZXIgRnVsbC1IRCBlRFAgdHJhbnNtaXR0ZXIgZGVzaWduZWQg
Zm9yCj4gKyAgcG9ydGFibGUgZGV2aWNlcy4KPiArCj4gK3Byb3BlcnRpZXM6Cj4gKyAgY29tcGF0
aWJsZToKPiArICAgIGNvbnN0OiBhbmFsb2dpeCxhbng2MzQ1Cj4gKwo+ICsgIHJlZzoKPiArICAg
IG1heEl0ZW1zOiAxCj4gKyAgICBkZXNjcmlwdGlvbjogSTJDIGFkZHJlc3Mgb2YgdGhlIGRldmlj
ZQo+ICsKPiArICByZXNldC1ncGlvczoKPiArICAgIG1heEl0ZW1zOiAxCj4gKyAgICBkZXNjcmlw
dGlvbjogYWN0aXZlIGxvdyBHUElPIHRvIHVzZSBmb3IgcmVzZXQKPiArCj4gKyAgZHZkZDEyLXN1
cHBseToKPiArICAgIG1heEl0ZW1zOiAxCj4gKyAgICBkZXNjcmlwdGlvbjogUmVndWxhdG9yIGZv
ciAxLjJWIGRpZ2l0YWwgY29yZSBwb3dlci4KPiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlh
bWwjL2RlZmluaXRpb25zL3BoYW5kbGUKPiArCj4gKyAgZHZkZDI1LXN1cHBseToKPiArICAgIG1h
eEl0ZW1zOiAxCj4gKyAgICBkZXNjcmlwdGlvbjogUmVndWxhdG9yIGZvciAyLjVWIGRpZ2l0YWwg
Y29yZSBwb3dlci4KPiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25z
L3BoYW5kbGUKClRoZXJlJ3Mgbm8gbmVlZCB0byBzcGVjaWZ5IHRoZSB0eXBlIGhlcmUsIGFsbCB0
aGUgcHJvcGVydGllcyBlbmRpbmcgaW4KLXN1cHBseSBhcmUgYWxyZWFkeSBjaGVja2VkIGZvciB0
aGF0IHR5cGUKCj4gKyAgcG9ydHM6Cj4gKyAgICB0eXBlOiBvYmplY3QKPiArICAgIG1pbkl0ZW1z
OiAxCj4gKyAgICBtYXhJdGVtczogMgo+ICsgICAgZGVzY3JpcHRpb246IHwKPiArICAgICAgVmlk
ZW8gcG9ydCAwIGZvciBMVlRUTCBpbnB1dCwKPiArICAgICAgVmlkZW8gcG9ydCAxIGZvciBlRFAg
b3V0cHV0IChwYW5lbCBvciBjb25uZWN0b3IpCj4gKyAgICAgIHVzaW5nIHRoZSBEVCBiaW5kaW5n
cyBkZWZpbmVkIGluCj4gKyAgICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
ZWRpYS92aWRlby1pbnRlcmZhY2VzLnR4dAoKWW91IHNob3VsZCBwcm9iYWJseSBkZXNjcmliZSB0
aGUgcG9ydEAwIGFuZCBwb3J0QDEgbm9kZXMgaGVyZSBhcwp3ZWxsLiBJdCB3b3VsZCBhbGxvdyB5
b3UgdG8gZXhwcmVzcyB0aGF0IHRoZSBwb3J0IDAgaXMgbWFuZGF0b3J5IGFuZAp0aGUgcG9ydCAx
IG9wdGlvbmFsLCB3aGljaCBnb3QgZHJvcHBlZCBpbiB0aGUgY29udmVyc2lvbi4KCk1heGltZQoK
LS0KTWF4aW1lIFJpcGFyZCwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2lu
ZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
