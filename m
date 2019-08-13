Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 462C68B999
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 15:09:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE92389CD9;
	Tue, 13 Aug 2019 13:09:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC2C89CD9
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 13:09:49 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 356452B2;
 Tue, 13 Aug 2019 15:09:46 +0200 (CEST)
Date: Tue, 13 Aug 2019 16:09:43 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 3/9] dt-bindings: display: panel: Add bindings for NEC
 NL8048HL11 panel
Message-ID: <20190813130943.GF5009@pendragon.ideasonboard.com>
References: <20190810231048.1921-1-laurent.pinchart@ideasonboard.com>
 <20190810231048.1921-4-laurent.pinchart@ideasonboard.com>
 <CAL_Jsq+NO+s1Wz5AYKzVqC=ki0mHtK8dr3namdt82DvnDebeyw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+NO+s1Wz5AYKzVqC=ki0mHtK8dr3namdt82DvnDebeyw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1565701786;
 bh=QYHmqFs2TTOoZVXKNm0ZlqOIRnSvZEPCKRYSJNgUsdk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rXBlLmILFa5H++fneGurs6ZDZqY5uS58kfgoZEdLVHKsl+zaC4sNm62B0QXEdz57g
 2r5LwKcxRt9oWaTXkwlCAqdae+0CCYaPV9xpXbO+csV34IWFiWDGkQai+CG5jBPZqS
 /69s7+vnu73d1G97/mAiLO6FcsDKLLfeKmQRLAYw=
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
Cc: devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLAoKT24gTW9uLCBBdWcgMTIsIDIwMTkgYXQgMDE6MTg6MzlQTSAtMDYwMCwgUm9iIEhl
cnJpbmcgd3JvdGU6Cj4gT24gU2F0LCBBdWcgMTAsIDIwMTkgYXQgNToxMCBQTSBMYXVyZW50IFBp
bmNoYXJ0IHdyb3RlOgo+ID4KPiA+IFRoZSBORUMgTkw4MDQ4SEwxMSBpcyBhIDEwLjRjbSBXVkdB
ICg4MDB4NDgwKSBwYW5lbCB3aXRoIGEgMjQtYml0IFJHQgo+ID4gcGFyYWxsZWwgZGF0YSBpbnRl
cmZhY2UgYW5kIGFuIFNQSSBjb250cm9sIGludGVyZmFjZS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4g
PiAtLS0KPiA+IENoYW5nZXMgc2luY2UgdjE6Cj4gPgo+ID4gLSBDb252ZXJ0IHRvIFlBTUwKPiA+
IC0tLQo+ID4gIC4uLi9kaXNwbGF5L3BhbmVsL25lYyxubDgwNDhobDExLnlhbWwgICAgICAgICB8
IDQ5ICsrKysrKysrKysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgNDkgaW5zZXJ0aW9u
cygrKQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9wYW5lbC9uZWMsbmw4MDQ4aGwxMS55YW1sCj4gPgo+ID4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL25lYyxu
bDgwNDhobDExLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9wYW5lbC9uZWMsbmw4MDQ4aGwxMS55YW1sCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4g
aW5kZXggMDAwMDAwMDAwMDAwLi5jYzNkNDA5NzU4MjgKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL25lYyxu
bDgwNDhobDExLnlhbWwKPiA+IEBAIC0wLDAgKzEsNDkgQEAKPiA+ICsjIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wCj4gPiArJVlBTUwgMS4yCj4gPiArLS0tCj4gPiArJGlkOiBodHRw
Oi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L3BhbmVsL25lYyxubDgwNDhobDExLnlh
bWwjCj4gPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3Jl
LnlhbWwjCj4gPiArCj4gPiArdGl0bGU6IE5FQyBOTDgwNDhITDExIDQuMSIgV1ZHQSBURlQgTENE
IHBhbmVsCj4gPiArCj4gPiArZGVzY3JpcHRpb246Cj4gPiArICBUaGUgTkVDIE5MODA0OEhMMTEg
aXMgYSA0LjEiIFdWR0EgVEZUIExDRCBwYW5lbCB3aXRoIGEgMjQtYml0IFJHQiBwYXJhbGxlbAo+
ID4gKyAgZGF0YSBpbnRlcmZhY2UgYW5kIGFuIFNQSSBjb250cm9sIGludGVyZmFjZS4KPiA+ICsK
PiA+ICttYWludGFpbmVyczoKPiA+ICsgIC0gTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5j
aGFydEBpZGVhc29uYm9hcmQuY29tPgo+ID4gKwo+ID4gK2FsbE9mOgo+ID4gKyAgLSAkcmVmOiBw
YW5lbC1jb21tb24ueWFtbCMKPiA+ICsKPiA+ICtwcm9wZXJ0aWVzOgo+ID4gKyAgY29tcGF0aWJs
ZToKPiA+ICsgICAgY29uc3Q6IG5lYyxubDgwNDhobDExCj4gPiArCj4gPiArICBsYWJlbDogdHJ1
ZQo+ID4gKyAgcmVzZXQtZ3Bpb3M6IHRydWUKPiA+ICsgIHBvcnQ6IHRydWUKPiA+ICsKPiA+ICty
ZXF1aXJlZDoKPiA+ICsgIC0gY29tcGF0aWJsZQo+ID4gKyAgLSByZXNldC1ncGlvcwo+ID4gKyAg
LSBwb3J0Cj4gPiArCj4gPiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCj4gPiArCj4gPiAr
ZXhhbXBsZXM6Cj4gCj4gWW91ciBleGFtcGxlIHdpbGwgZmFpbCBvbiAnbWFrZSBkdF9iaW5kaW5n
X2NoZWNrJy4uLgoKSSB3YXNuJ3QgYXdhcmUgb2YgdGhpcy4gSSd2ZSBub3cgcmVhZCB3cml0aW5n
LXNjaGVtYS5tZCBhbmQgd2lsbCBtYWtlCnN1cmUgdG8gc3VibWl0IGJpbmRpbmdzIHRoYXQgcGFz
cyB0aGUgY2hlY2tzLiBJJ2xsIGFkZHJlc3MgdGhlIGlzc3Vlcwp5b3VyIHBvaW50ZWQgb3V0IGJl
bG93IGZvciB0aGUgbmV4dCB2ZXJzaW9uLgoKPiA+ICsgIC0gfAo+ID4gKyAgICBsY2RfcGFuZWw6
IHBhbmVsIHsKPiAKPiBTUEkgZGV2aWNlcyBoYXZlIHRvIGhhdmUgYSBtaW5pbWFsIFNQSSBjb250
cm9sbGVyIHBhcmVudC4gUHJpbWFyaWx5Cj4ganVzdCAjc2l6ZS1jZWxscyBhbmQgI2FkZHJlc3Mt
Y2VsbHMgYXJlIG5lZWRlZC4KPiAKPiAncmVnJyBpcyBtaXNzaW5nIGhlcmUgdG9vLgo+IAo+ID4g
KyAgICAgIGNvbXBhdGlibGUgPSAibmVjLG5sODA0OGhsMTEiOwo+ID4gKyAgICAgIHNwaS1tYXgt
ZnJlcXVlbmN5ID0gPDEwMDAwMDAwPjsKPiAKPiBUaGlzIG5lZWRzIHRvIGJlIGxpc3RlZCBpbiBw
cm9wZXJ0aWVzIGlkZWFsbHkgd2l0aCBzb21lIGNvbnN0cmFpbnRzLgo+IAo+ID4gKwo+ID4gKyAg
ICAgIHJlc2V0LWdwaW9zID0gPCZncGlvNyA3IEdQSU9fQUNUSVZFX0xPVz47Cj4gCj4gQW5kIEdQ
SU9fQUNUSVZFX0xPVy4gWW91IGhhdmUgdG8gYWRkIGluY2x1ZGVzIHlvdSBuZWVkLgo+IAo+ID4g
Kwo+ID4gKyAgICAgIHBvcnQgewo+ID4gKyAgICAgICAgbGNkX2luOiBlbmRwb2ludCB7Cj4gPiAr
ICAgICAgICAgIHJlbW90ZS1lbmRwb2ludCA9IDwmZHBpX291dD47Cj4gPiArICAgICAgICB9Owo+
ID4gKyAgICAgIH07Cj4gPiArICAgIH07Cj4gPiArCj4gPiArLi4uCgotLSAKUmVnYXJkcywKCkxh
dXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
