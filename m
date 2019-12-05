Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E61B113C7F
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 08:44:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C4B66E981;
	Thu,  5 Dec 2019 07:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 593D76E97E
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 07:06:35 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlSVXA4P1+M="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 46.0.2 DYNA|AUTH)
 with ESMTPSA id 6067eavB576KDCd
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Thu, 5 Dec 2019 08:06:20 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH 2/2] dt-bindings: display: Add obsolete note to "ti, tilcdc,
 panel" binding
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <eabe78184ea7125dcff50826a0ee12a892443017.1575481630.git.jsarha@ti.com>
Date: Thu, 5 Dec 2019 08:06:18 +0100
Message-Id: <55DCFF0C-E03E-44DA-A3BE-C81AA4D6782E@goldelico.com>
References: <cover.1575481630.git.jsarha@ti.com>
 <eabe78184ea7125dcff50826a0ee12a892443017.1575481630.git.jsarha@ti.com>
To: Jyri Sarha <jsarha@ti.com>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Thu, 05 Dec 2019 07:44:39 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1575529593; 
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=FsJZPo0fckXEPJFWV4L4hsFM0Ad6IWDsYKHf+3rwx4k=;
 b=C47rbkH1sGYSJU1X7l6HoMQjPcrIWjM75pRft2pkX87bQ8IsDVlDI8mxz+voYSAv5W
 q7LyNNxwaDMkaxMgjCBL16j/W6f4rTT3eNe/A1F58DAdFbki8JYchDYLQu75uX7lkoi1
 U5/IYbiTFrubtdKlzx1fDt0Ke/za1teucJ/JulrgkNOrVgek1D8ptWEmgR/P1/aVEKtM
 IcbdUrgg3SZlXxUoY2xgLcrgrbCb1wiVHKNa8MFXm5wk5JqZ5lHjZF+XoLaNxrkOx0YU
 XCn3SgCKmoW+CCb00jMei4Q+fagFzlIMjPAtgJOKXhiSZsOMsM+26prvjbPW93sj0uYf
 YcSA==
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
Cc: devicetree@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 tomi.valkeinen@ti.com, dri-devel <dri-devel@lists.freedesktop.org>,
 peter.ujfalusi@ti.com, robh+dt@kernel.org, laurent.pinchart@ideasonboard.com,
 linux-omap@vger.kernel.org, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cj4gQW0gMDQuMTIuMjAxOSB1bSAxODo1MyBzY2hyaWViIEp5cmkgU2FyaGEgPGpzYXJoYUB0aS5j
b20+Ogo+IAo+IFRoZSAidGksdGlsY2RjLHBhbmVsIiBiaW5kaW5nIHNob3VsZCBub3QgYmUgdXNl
ZCBhbnltb3JlLCBzaW5jZSB0aWxjZGMKPiBpcyBmdWxseSBjYXBhYmxlIG9mIHVzaW5nIGdlbmVy
aWMgZHJtIHBhbmVscyBsaWtlIHBhbmVsLXNpbXBsZSBhbmQKPiBwYW5lbC1jb21tb24gYmluZGlu
Zy4KCklzIHRoZXJlIGFuIGV4YW1wbGUgaG93IHRvIGNvbnZlcnQ/CgpBcyBmYXIgYXMgSSBjYW4g
c2VlIGFsbCBhcmNoL2FybS9ib290L2R0cy9hbTMzNXgtKi5kdHMgdXNlICJ0aSx0aWxjZGMscGFu
ZWwiCgphcmNoL2FybS9ib290L2R0cy9hbTMzNXgtZXZtLmR0cyB3b3VsZCBJTUhPIGJlIGEgZ29v
ZCBjYW5kaWRhdGUuCgo+IEhvd2V2ZXIsIHRoZSBvYnNvbGV0ZSBiaW5kaW5nIGlzIHN0aWxsIHdp
ZGVseQo+IHVzZWQgaW4gbWFueSBtYWlubGluZSBzdXBwb3J0ZWQgcGxhdGZvcm1zIHRoYXQgSSBk
byBub3QgaGF2ZSBhY2Nlc3MgdG8KPiBhbmQgd2hvIGtub3dzIGhvdyBtYW55IGN1c3RvbSBwbGF0
Zm9ybXMuIFNvIEkgYW0gYWZyYWlkIHdlIGhhdmUgdG8KPiBrZWVwIHRoZSBvbGQgYnVuZGxlZCB0
aWxjZGMgcGFuZWwgZHJpdmVyIGFyb3VuZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKeXJpIFNhcmhh
IDxqc2FyaGFAdGkuY29tPgo+IC0tLQo+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L3RpbGNkYy9wYW5lbC50eHQgfCA2ICsrKysrKwo+IDEgZmlsZSBjaGFuZ2VkLCA2
IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvdGlsY2RjL3BhbmVsLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L3RpbGNkYy9wYW5lbC50eHQKPiBpbmRleCA4MDgyMTYzMTBl
YTIuLjU0OTYzZjkxNzNjYyAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS90aWxjZGMvcGFuZWwudHh0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvdGlsY2RjL3BhbmVsLnR4dAo+IEBAIC0xLDUgKzEs
MTEgQEAKPiBEZXZpY2UtVHJlZSBiaW5kaW5ncyBmb3IgdGlsY2RjIERSTSBnZW5lcmljIHBhbmVs
IG91dHB1dCBkcml2ZXIKPiAKPiArTk9URTogVGhpcyBiaW5kaW5nIChhbmQgdGhlIHJlbGF0ZWQg
ZHJpdmVyKSBpcyBvYnNvbGV0ZSBhbmQgc2hvdWxkIG5vdAo+ICsgICAgICBiZSB1c2VkIGFueW1v
cmUuIFBsZWFzZSByZWZlciB0byBkcm0gcGFuZWwtY29tbW9uIGJpbmRpbmcgKGFuZAo+ICsgICAg
ICB0byBhIGdlbmVyaWMgZHJtIHBhbmVsIGRyaXZlciBsaWtlIHBhbmVsLXNpbXBsZSkuCj4gKyAg
ICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3BhbmVs
LWNvbW1vbi55YW1sCj4gKyAgICAgIChkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxl
LmMpCj4gKwo+IFJlcXVpcmVkIHByb3BlcnRpZXM6Cj4gIC0gY29tcGF0aWJsZTogdmFsdWUgc2hv
dWxkIGJlICJ0aSx0aWxjZGMscGFuZWwiLgo+ICAtIHBhbmVsLWluZm86IGNvbmZpZ3VyYXRpb24g
aW5mbyB0byBjb25maWd1cmUgTENEQyBjb3JyZWN0bHkgZm9yIHRoZSBwYW5lbAo+IC0tIAo+IFRl
eGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNp
bmtpLiBZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxl
OiBIZWxzaW5raQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
