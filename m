Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 206BB1D10B3
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 13:10:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05BEA6E9FC;
	Wed, 13 May 2020 11:10:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD686E9FC
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 11:10:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: rcn)
 with ESMTPSA id 1B6D92A0521
Date: Wed, 13 May 2020 13:09:57 +0200
From: Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [RFC PATCH] dt-bindings: display: ti,tfp410.txt: convert to yaml
Message-ID: <20200513110957.dgb3axle24pmqp3a@rcn-XPS-13-9360>
Mail-Followup-To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, robh+dt@kernel.org,
 kernel@collabora.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, jason@lakedaemon.net
References: <20200428092048.14939-1-ricardo.canuelo@collabora.com>
 <3e377c73-25a3-a7b3-0604-41c54d70039e@ti.com>
 <20200506155320.GC15206@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200506155320.GC15206@pendragon.ideasonboard.com>
User-Agent: NeoMutt/20171215
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
Cc: devicetree@vger.kernel.org, jason@lakedaemon.net,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwKCk9uIG1pw6kgMDYtMDUtMjAyMCAxODo1MzoyMCwgTGF1cmVudCBQaW5jaGFy
dCB3cm90ZToKPiBJIGRpZG4ndCBpZiBJIHJlbWVtYmVyIGNvcnJlY3RseSwgSSBqdXN0IG1hcHBl
ZCBpdCB0byB0aGUgaGFyZHdhcmUKPiBmZWF0dXJlcy4gVGhlIGhhcmR3YXJlIHJlZ2lzdGVyIGlu
ZGVlZCB0YWtlcyBhIHZhbHVlIGJldHdlZW4gMCBhbmQgNywKPiBhbmQgdGhhdCBpcyBtYXBwZWQg
dG8gWy00LDNdIHggdChTVEVQKS4gSSBkb24ndCBtaW5kIGVpdGhlciBvcHRpb24uCgpJIHdhcyB0
YWtpbmcgYSBsb29rIGF0IHRoZSB0aS10ZnA0MTAuYyBkcml2ZXIgdG8gc2VlIGlmIGl0IG5lZWRz
IGFueQpjaGFuZ2VzIHRvIHN1cHBvcnQgdGhlIHVwZGF0ZWQgZGVza2V3IHByb3BlcnR5IHJhbmdl
cyBbMC03XSwgYnV0IEkgZG9uJ3QKZnVsbHkgdW5kZXJzdGFuZCB3aGF0IHRoaXMgZG9lcyAobGlu
ZSAyNzYpOgoKCS8qIEdldCB0aGUgc2V0dXAgYW5kIGhvbGQgdGltZSBmcm9tIHZlbmRvci1zcGVj
aWZpYyBwcm9wZXJ0aWVzLiAqLwoJb2ZfcHJvcGVydHlfcmVhZF91MzIoZHZpLT5kZXYtPm9mX25v
ZGUsICJ0aSxkZXNrZXciLCAodTMyICopJmRlc2tldyk7CglpZiAoZGVza2V3IDwgLTQgfHwgZGVz
a2V3ID4gMykKCQlyZXR1cm4gLUVJTlZBTDsKCgl0aW1pbmdzLT5zZXR1cF90aW1lX3BzID0gbWlu
KDAsIDEyMDAgLSAzNTAgKiBkZXNrZXcpOwoJdGltaW5ncy0+aG9sZF90aW1lX3BzID0gbWluKDAs
IDEzMDAgKyAzNTAgKiBkZXNrZXcpOwoKSXQgbG9va3MgbGlrZSB0aGF0IHRoZSBkcml2ZXIgZG9l
c24ndCByZWFsbHkgYXBwbHkgdGhlIGRlc2tldyBzZXR0aW5ncwp0byB0aGUgZGV2aWNlIGFuZCB0
aGF0IHRoaXMgaGFzIG5vdCBiZWVuIHJlYWxseSB0ZXN0ZWQsIHNvIGl0J3MgcHJvYmFibHkKbm90
IGEgYmlnIGRlYWwuCgpJIGd1ZXNzIHdoYXQgeW91IHdhbnRlZCB0byBkbyB3YXMgdG8gYWRqdXN0
IHRoZSBzZXR1cCBhbmQgaG9sZCB0aW1lcwphcm91bmQgMTIwMCBhbmQgMTMwMCBwcyByZXNwZWN0
aXZlbHkgaW4gaW5jcmVtZW50cy9kZWNyZW1lbnRzIG9mIDM1MCBwcwpkZXBlbmRpbmcgb24gdGhl
IGRlc2tldyB2YWx1ZSwgYXMgdGhlIGRhdGFzaGVldCBkZXNjcmliZXMuIEJ1dCB0aGlzIGNvZGUK
d291bGQgc2V0IHRpbWluZ3MtPnNldHVwX3RpbWVfcHMgdG8gMCByZWdhcmRsZXNzIG9mIHRoZSBk
ZXNrZXcgdmFsdWUsCmFuZCB0aW1pbmdzLT5ob2xkX3RpbWVfcHMgd291bGQgYmUgZWl0aGVyIDAg
b3IgYSB2ZXJ5IGJpZyBpbnRlZ2VyIHZhbHVlCmlmIGRlc2tldyBpcyAtNCAoYm90aCBzZXR1cF90
aW1lX3BzIGFuZCBob2xkX3RpbWVfcHMgYXJlIHUzMikuCgpBbSBJIG1pc3Npbmcgc29tZXRoaW5n
PyBXYXMgdGhpcyBpbnRlbnRpb25hbD8KClRoYW5rcywKUmljYXJkbwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
