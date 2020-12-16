Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A0D2DBC2C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 08:44:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F1789DCF;
	Wed, 16 Dec 2020 07:44:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEFF789DCF
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 07:44:07 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BG7hxf7017765;
 Wed, 16 Dec 2020 01:43:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1608104639;
 bh=byAY0YOySDZHqN3AMHRmiG2cAHMSpPrHA212GEHba1k=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=vxyzAt/MjY7EdKOjyQW80QXWKobbukKS/c9jb8SeKGQ0ScGPA5okiop9qJzYH3znF
 5Ef1wuciuo9jYktpk5SoYwR8n0XrxMcvZ8I061EzjQl1JVn/KekqN9Op5Wda4ploNr
 HlMGzptpZgREOr6PVdmI7KK0U5RlER5HWkv2jIIY=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BG7hxxF074913
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 16 Dec 2020 01:43:59 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 16
 Dec 2020 01:43:58 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 16 Dec 2020 01:43:58 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BG7ht1Q114860;
 Wed, 16 Dec 2020 01:43:56 -0600
Subject: Re: [PATCH] dt-bindings: display: bridge: tc358768: Remove maintainer
 information
To: Rob Herring <robh@kernel.org>
References: <20201215124227.1872-1-peter.ujfalusi@ti.com>
 <1608042367.307112.3775381.nullmailer@robh.at.kernel.org>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <90d45716-4f4e-7379-07fd-74eff793e498@ti.com>
Date: Wed, 16 Dec 2020 09:44:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <1608042367.307112.3775381.nullmailer@robh.at.kernel.org>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 narmstrong@baylibre.com, airlied@linux.ie, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDE1LzEyLzIwMjAgMTYuMjYsIFJvYiBIZXJyaW5nIHdyb3RlOgo+IE9uIFR1ZSwgMTUgRGVj
IDIwMjAgMTQ6NDI6MjcgKzAyMDAsIFBldGVyIFVqZmFsdXNpIHdyb3RlOgo+PiBNeSBlbXBsb3lt
ZW50IHdpdGggVEkgaXMgY29taW5nIHRvIGFuIGVuZCBhbmQgSSB3aWxsIG5vdCBoYXZlIGFjY2Vz
cyB0bwo+PiB0aGUgYm9hcmQgd2hlcmUgdGhpcyBicmlkZ2UgaXMgY29ubmVjdGVkIHRvLgo+Pgo+
PiBJdCBpcyBiZXR0ZXIgdG8gcmVtb3ZlIGEgc29vbiBib3VuY2luZyBlbWFpbCBhZGRyZXNzLgo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBVamZhbHVzaSA8cGV0ZXIudWpmYWx1c2lAdGkuY29t
Pgo+PiAtLS0KPj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3Rvc2hp
YmEsdGMzNTg3NjgueWFtbCAgIHwgMyAtLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9u
cygtKQo+Pgo+IAo+IE15IGJvdCBmb3VuZCBlcnJvcnMgcnVubmluZyAnbWFrZSBkdF9iaW5kaW5n
X2NoZWNrJyBvbiB5b3VyIHBhdGNoOgo+IAo+IHlhbWxsaW50IHdhcm5pbmdzL2Vycm9yczoKPiAK
PiBkdHNjaGVtYS9kdGMgd2FybmluZ3MvZXJyb3JzOgo+IC9idWlsZHMvcm9iaGVycmluZy9saW51
eC1kdC1yZXZpZXcvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJp
ZGdlL3Rvc2hpYmEsdGMzNTg3NjgueWFtbDogJ21haW50YWluZXJzJyBpcyBhIHJlcXVpcmVkIHBy
b3BlcnR5Cj4gL2J1aWxkcy9yb2JoZXJyaW5nL2xpbnV4LWR0LXJldmlldy9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvdG9zaGliYSx0YzM1ODc2OC55YW1s
OiBpZ25vcmluZywgZXJyb3IgaW4gc2NoZW1hOiAKPiB3YXJuaW5nOiBubyBzY2hlbWEgZm91bmQg
aW4gZmlsZTogLi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlk
Z2UvdG9zaGliYSx0YzM1ODc2OC55YW1sCgpSaWdodCwgc28gaXQgaXMgbm90IHRoYXQgZWFzeSB0
byBub3QgYmVlbiBhYmxlIHRvIG1haW50YWluIHRoaXMuLi4gOm8KCldobyBzaG91bGQgYmUgZG9j
dW1lbnRlZCBhcyBtYWludGFpbmVyPwpBbmRyemVqLCBOZWlsLCBEYXZpZCBvciBEYW5pZWw/CgpJ
IHdpbGwgaGF2ZSBubyBhY2Nlc3MgdG8gdGhlIEVWTSAoSSBubyBsb25nZXIgaGF2ZSkgYW5kIHRo
ZQpkb2N1bWVudGF0aW9uIGlzIGdvaW5nIHRvIGJlIHdpcGVkIGFsb25nIHdpdGggdGhlIGRpc2sg
YXMgd2VsbC4uLgoKPiBTZWUgaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wYXRjaC8xNDE2
NDE5Cj4gCj4gVGhpcyBjaGVjayBjYW4gZmFpbCBpZiB0aGVyZSBhcmUgYW55IGRlcGVuZGVuY2ll
cy4gVGhlIGJhc2UgZm9yIGEgcGF0Y2gKPiBzZXJpZXMgaXMgZ2VuZXJhbGx5IHRoZSBtb3N0IHJl
Y2VudCByYzEuCj4gCj4gSWYgeW91IGFscmVhZHkgcmFuICdtYWtlIGR0X2JpbmRpbmdfY2hlY2sn
IGFuZCBkaWRuJ3Qgc2VlIHRoZSBhYm92ZQo+IGVycm9yKHMpLCB0aGVuIG1ha2Ugc3VyZSAneWFt
bGxpbnQnIGlzIGluc3RhbGxlZCBhbmQgZHQtc2NoZW1hIGlzIHVwIHRvCj4gZGF0ZToKPiAKPiBw
aXAzIGluc3RhbGwgZHRzY2hlbWEgLS11cGdyYWRlCj4gCj4gUGxlYXNlIGNoZWNrIGFuZCByZS1z
dWJtaXQuCj4gCgotIFDDqXRlcgoKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2th
bGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIx
LTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
