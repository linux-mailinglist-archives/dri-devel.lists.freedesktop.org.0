Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E8C113C2B
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 08:14:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A27746E97E;
	Thu,  5 Dec 2019 07:14:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A156E97E
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 07:14:18 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB57E1hv082932;
 Thu, 5 Dec 2019 01:14:01 -0600
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB57E0es097065;
 Thu, 5 Dec 2019 01:14:00 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 5 Dec
 2019 01:14:00 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 5 Dec 2019 01:14:00 -0600
Received: from [10.1.3.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB57Dvrb062767;
 Thu, 5 Dec 2019 01:13:57 -0600
Subject: Re: [PATCH 2/2] dt-bindings: display: Add obsolete note to
 "ti,tilcdc,panel" binding
To: "H. Nikolaus Schaller" <hns@goldelico.com>
References: <cover.1575481630.git.jsarha@ti.com>
 <eabe78184ea7125dcff50826a0ee12a892443017.1575481630.git.jsarha@ti.com>
 <55DCFF0C-E03E-44DA-A3BE-C81AA4D6782E@goldelico.com>
From: Jyri Sarha <jsarha@ti.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jsarha@ti.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <c918d309-4a97-af0b-ef8c-4140b29327ee@ti.com>
Date: Thu, 5 Dec 2019 09:13:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <55DCFF0C-E03E-44DA-A3BE-C81AA4D6782E@goldelico.com>
Content-Language: en-GB
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1575530041;
 bh=dkFv6j9fRjqBhXFVZB7BZd45r5LtSIjtFSiHCS/++VY=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=UqMx0a0ByuAq/T7JX8L+w97j1tm7X5NVg+1YJalkBUEUbCLT4LygU7Pytj38SjuWF
 ZO5n93XuCrvnaRyTlK9DMGVykq/G5COai3JAvg9k/DpvVVrHHS/E96vtj+Z6mCDpGt
 SgXd39XCKBCCu3A4s0037E+7qSb5+Yif+DU1o8sw=
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

T24gMDUvMTIvMjAxOSAwOTowNiwgSC4gTmlrb2xhdXMgU2NoYWxsZXIgd3JvdGU6Cj4gCj4+IEFt
IDA0LjEyLjIwMTkgdW0gMTg6NTMgc2NocmllYiBKeXJpIFNhcmhhIDxqc2FyaGFAdGkuY29tPjoK
Pj4KPj4gVGhlICJ0aSx0aWxjZGMscGFuZWwiIGJpbmRpbmcgc2hvdWxkIG5vdCBiZSB1c2VkIGFu
eW1vcmUsIHNpbmNlIHRpbGNkYwo+PiBpcyBmdWxseSBjYXBhYmxlIG9mIHVzaW5nIGdlbmVyaWMg
ZHJtIHBhbmVscyBsaWtlIHBhbmVsLXNpbXBsZSBhbmQKPj4gcGFuZWwtY29tbW9uIGJpbmRpbmcu
Cj4gCj4gSXMgdGhlcmUgYW4gZXhhbXBsZSBob3cgdG8gY29udmVydD8KPiAKPiBBcyBmYXIgYXMg
SSBjYW4gc2VlIGFsbCBhcmNoL2FybS9ib290L2R0cy9hbTMzNXgtKi5kdHMgdXNlICJ0aSx0aWxj
ZGMscGFuZWwiCj4gCj4gYXJjaC9hcm0vYm9vdC9kdHMvYW0zMzV4LWV2bS5kdHMgd291bGQgSU1I
TyBiZSBhIGdvb2QgY2FuZGlkYXRlLgo+IAoKWWVzLCB0aGVyZSBpcy4gSGVyZSBhcmUgdGhlIHBh
dGNoZXMgdG8gY29udmVydCBhbTMzNXgtZXZtLmR0cyBhbmQKYW0zMzV4LWV2bXNrLmR0czoKCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2RyaS1kZXZlbC8yMDE5LURlY2Vt
YmVyLzI0NzMwMS5odG1sCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2Ry
aS1kZXZlbC8yMDE5LURlY2VtYmVyLzI0NzU5NC5odG1sCgpJIHdvdWxkIGhhdmUgYWRkZWQgYSBy
ZWZlcmVuY2UgdG8gdGhlIG5vdGUsIGJ1dCBzaW5jZSB0aGUgcGF0Y2hlcyBhcmUKbm90IHlldCBx
dWV1ZWQgdG8gbWFpbmxpbmUsIEkgZGVjaWRlZCBhZ2FpbnN0IGl0LgoKVGhlIGZpcnN0IHRoaW5n
IHRvIGRvIGJlZm9yZSBjb252ZXJzaW9uIGlzIHRvIGNoZWNrIGlmIHBhbmVsLXNpbXBsZSAob3IK
c29tZSBvdGhlciBnZW5lcmljIGRybSBwYW5lbCBkcml2ZXIpIGFscmVhZHkgc3VwcG9ydHMgdGhl
IHVzZWQgcGFuZWwuIElmCnllcywgdGhlbiB0aGUgY29udmVyc2lvbiBzaG91bGQgYmUgcXVpdGUg
c3RyYWlnaHQgZm9yd2FyZHMuIElmIG5vdCwgdGhlbgp0aGUgZmlyc3QgdGhpbmcgdG8gZG8gaXMg
dG8gYWRkIHN1cHBvcnQgZm9yIHRoZSB1c2VkIHBhbmVsIGludG8KcGFuZWwtc2ltcGxlLmMuCgpC
ZXN0IHJlZ2FyZHMsCkp5cmkKCgo+PiBIb3dldmVyLCB0aGUgb2Jzb2xldGUgYmluZGluZyBpcyBz
dGlsbCB3aWRlbHkKPj4gdXNlZCBpbiBtYW55IG1haW5saW5lIHN1cHBvcnRlZCBwbGF0Zm9ybXMg
dGhhdCBJIGRvIG5vdCBoYXZlIGFjY2VzcyB0bwo+PiBhbmQgd2hvIGtub3dzIGhvdyBtYW55IGN1
c3RvbSBwbGF0Zm9ybXMuIFNvIEkgYW0gYWZyYWlkIHdlIGhhdmUgdG8KPj4ga2VlcCB0aGUgb2xk
IGJ1bmRsZWQgdGlsY2RjIHBhbmVsIGRyaXZlciBhcm91bmQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IEp5cmkgU2FyaGEgPGpzYXJoYUB0aS5jb20+Cj4+IC0tLQo+PiBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS90aWxjZGMvcGFuZWwudHh0IHwgNiArKysrKysKPj4gMSBm
aWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvdGlsY2RjL3BhbmVsLnR4dCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3RpbGNkYy9wYW5lbC50eHQKPj4g
aW5kZXggODA4MjE2MzEwZWEyLi41NDk2M2Y5MTczY2MgMTAwNjQ0Cj4+IC0tLSBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3RpbGNkYy9wYW5lbC50eHQKPj4gKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvdGlsY2RjL3BhbmVs
LnR4dAo+PiBAQCAtMSw1ICsxLDExIEBACj4+IERldmljZS1UcmVlIGJpbmRpbmdzIGZvciB0aWxj
ZGMgRFJNIGdlbmVyaWMgcGFuZWwgb3V0cHV0IGRyaXZlcgo+Pgo+PiArTk9URTogVGhpcyBiaW5k
aW5nIChhbmQgdGhlIHJlbGF0ZWQgZHJpdmVyKSBpcyBvYnNvbGV0ZSBhbmQgc2hvdWxkIG5vdAo+
PiArICAgICAgYmUgdXNlZCBhbnltb3JlLiBQbGVhc2UgcmVmZXIgdG8gZHJtIHBhbmVsLWNvbW1v
biBiaW5kaW5nIChhbmQKPj4gKyAgICAgIHRvIGEgZ2VuZXJpYyBkcm0gcGFuZWwgZHJpdmVyIGxp
a2UgcGFuZWwtc2ltcGxlKS4KPj4gKyAgICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L3BhbmVsL3BhbmVsLWNvbW1vbi55YW1sCj4+ICsgICAgICAoZHJpdmVycy9n
cHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jKQo+PiArCj4+IFJlcXVpcmVkIHByb3BlcnRpZXM6
Cj4+ICAtIGNvbXBhdGlibGU6IHZhbHVlIHNob3VsZCBiZSAidGksdGlsY2RjLHBhbmVsIi4KPj4g
IC0gcGFuZWwtaW5mbzogY29uZmlndXJhdGlvbiBpbmZvIHRvIGNvbmZpZ3VyZSBMQ0RDIGNvcnJl
Y3RseSBmb3IgdGhlIHBhbmVsCj4+IC0tIAo+PiBUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95
LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4gWS10dW5udXMvQnVzaW5lc3MgSUQ6
IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKPj4KPiAKCgotLSAKVGV4
YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lu
a2kuClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6
IEhlbHNpbmtpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
