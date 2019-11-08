Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC30F6CC8
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 03:30:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC046E842;
	Mon, 11 Nov 2019 02:29:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6C4416FA0B
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 16:45:49 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 5C24280D4;
 Fri,  8 Nov 2019 16:46:22 +0000 (UTC)
Date: Fri, 8 Nov 2019 08:45:43 -0800
From: Tony Lindgren <tony@atomide.com>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v2 1/8] RFC: dt-bindings: add img,pvrsgx.yaml for
 Imagination GPUs
Message-ID: <20191108164543.GD5610@atomide.com>
References: <cover.1573124770.git.hns@goldelico.com>
 <4292cec1fd82cbd7d42742d749557adb01705574.1573124770.git.hns@goldelico.com>
 <CAL_Jsq+ri3AXb=qhedBzQ6WufLm4aPrSqNxXiHd3_=mH3vJ8xw@mail.gmail.com>
 <52549A4C-F49D-4FE9-9CD2-B331FB486BA9@goldelico.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <52549A4C-F49D-4FE9-9CD2-B331FB486BA9@goldelico.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Mon, 11 Nov 2019 02:29:25 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Paul Burton <paulburton@kernel.org>, David Airlie <airlied@linux.ie>,
 James Hogan <jhogan@kernel.org>,
 OpenPVRSGX Linux Driver Group <openpvrsgx-devgroup@letux.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh+dt@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 kernel@pyra-handheld.com, linux-omap <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KiBILiBOaWtvbGF1cyBTY2hhbGxlciA8aG5zQGdvbGRlbGljby5jb20+IFsxOTExMDcgMTY6NTZd
Ogo+ID4gQW0gMDcuMTEuMjAxOSB1bSAxNTozNSBzY2hyaWViIFJvYiBIZXJyaW5nIDxyb2JoK2R0
QGtlcm5lbC5vcmc+Ogo+ID4gT24gVGh1LCBOb3YgNywgMjAxOSBhdCA1OjA2IEFNIEguIE5pa29s
YXVzIFNjaGFsbGVyIDxobnNAZ29sZGVsaWNvLmNvbT4gd3JvdGU6Cj4gPj4gQ2xvY2ssIFJlc2V0
IGFuZCBwb3dlciBtYW5hZ2VtZW50IHNob3VsZCBiZSBoYW5kbGVkCj4gPj4gYnkgYSBwYXJlbnQg
bm9kZSBvciBlbHNld2hlcmUuCj4gPiAKPiA+IFRoYXQncyBwcm9iYWJseSBUSSBzcGVjaWZpYy4u
Lgo+IAo+IFllcyBhbmQgbm8uCj4gCj4gRm9yIGV4YW1wbGUgdGhlIGltZzQ3ODAgc2VlbXMgdG8g
bmVlZCBhIGNsb2NrIHJlZmVyZW5jZSBpbiB0aGUKPiBncHUgbm9kZS4gQnV0IGl0IGNvdWxkIG1h
eWJlIGNvbm5lY3RlZCBpbiBhIHBhcmVudCBub2RlIGxpa2UgcmVjZW50Cj4gVEkgU29DIGRvIHdp
dGggdGhlIHRhcmdldC1tb2R1bGUgYXBwcm9hY2guCgpUaGUgY2xvY2tzIGFyZSBpbXBsZW1lbnRl
ZCBhdCB0aGUgU29DIGdsdWUgbGF5ZXIgYW5kL29yIHRoZQppbnRlcmNvbm5lY3QgbGF5ZXIsIGFu
ZCB0aGVuIHRoZSBkZXZpY2UgcHJvYmFibHkgaGFzIGl0J3MKb3duIGNsb2NrIGdhdGUgY29udHJv
bHMuCgo+IEFuZCBvdXIgZ29hbCBpcyB0byBlbmQgdXAgd2l0aCBhIGNvbW1vbiBkcml2ZXIgZm9y
IGFsbCBTb0MgYW5kIGFyY2hpdGVjdHVyZXMKPiBpbiBmYXIgZnV0dXJlLiBUaGVuLCBwcm9iYWJs
eSBjbG9jaywgcmVzZXQgYW5kIHBvd2VyIG1hbmFnZW1lbnQgc2hvdWxkCj4gYmUgaGFuZGxlZCBp
biB0aGUgc2FtZSB3YXkuCgpZZWFoIHNvIHRoYXQncyBzdGFuZGFyZCBMaW51eCBmZWF0dXJlcyBz
dWNoIGFzIFBNIHJ1bnRpbWUKYW5kIGdlbnBkIGJhc2ljYWxseSA6KQoKU28geW91IGNhbiBqdXN0
IGxlYXZlIG91dCB0aGUgY2xvY2tzIHBhcmFncmFwaCBmcm9tIHRoZQpiaW5kaW5nLiBUaGVuIGlm
IGNsb2NrcyBhcmUgcmVhbGx5IG5lZWRlZCBiZXlvbmQgUE0gcnVudGltZQphbmQgZ2VucGQsIHRo
b3NlIGNhbiBhbHdheXMgYmUgYWRkZWQgbGF0ZXIuCgpXZSBqdXN0IG5lZWQgYSBzdXBlciBtaW5p
bWFsIGJpbmRpbmcgdG8gc3RhcnQgd2l0aCB0aGF0Cm9ubHkgdXNlcyBzdGFuZGFyZCBwcm9wZXJ0
aWVzLCB0aGVuIG1vcmUgY2FuIGJlIGFkZGVkCmxhdGVyIGlmIG5lZWRlZC4KClJlZ2FyZHMsCgpU
b255Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
