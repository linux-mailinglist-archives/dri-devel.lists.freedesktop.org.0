Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 207621D1770
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 16:21:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F8156E484;
	Wed, 13 May 2020 14:21:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 518406E484
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 14:20:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: rcn)
 with ESMTPSA id 56F3B2A242D
Date: Wed, 13 May 2020 16:20:13 +0200
From: Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [RFC PATCH] dt-bindings: display: ti,tfp410.txt: convert to yaml
Message-ID: <20200513142013.xzz2dlzt4hptzyxf@rcn-XPS-13-9360>
Mail-Followup-To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, robh+dt@kernel.org,
 kernel@collabora.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, jason@lakedaemon.net
References: <20200428092048.14939-1-ricardo.canuelo@collabora.com>
 <3e377c73-25a3-a7b3-0604-41c54d70039e@ti.com>
 <20200506155320.GC15206@pendragon.ideasonboard.com>
 <20200513110957.dgb3axle24pmqp3a@rcn-XPS-13-9360>
 <20200513140832.GI5945@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513140832.GI5945@pendragon.ideasonboard.com>
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

SGkgTGF1cmVudCwKCk9uIG1pw6kgMTMtMDUtMjAyMCAxNzowODozMiwgTGF1cmVudCBQaW5jaGFy
dCB3cm90ZToKPiBUaGUgZHJpdmVyIGRvZXNuJ3QgYXBwbHkgYW55IHNldHRpbmcgdG8gdGhlIGRl
dmljZSA6LSkgVGhlIHRpLGRlc2tldwo+IHByb3BlcnR5IGlzIG1lYW50IHRvIHJlcG9ydCB0aGUg
ZGVza2V3IHNldHRpbmdzIHNlbGVjdGVkIGJ5IHRoZSBjaGlwJ3MKPiBjb25maWd1cmF0aW9uIHBp
bnMsIG5vdCB0byBzZXQgYSB2YWx1ZSB0byBiZSBwcm9ncmFtbWVkIHRvIHRoZSBkZXZpY2UuCgpP
aCwgSSBzZWUsIHRoYW5rcyBmb3IgY2xhcmlmeWluZyBpdC4KCj4gV291bGQgeW91IGxpa2UgdG8g
c2VuZCBhIHBhdGNoLCBvciBzaG91bGQgSSBkbyBzbyA/CgpJIGNhbiB0YWtlIGNhcmUgb2YgaXQs
IEknbGwgdHJ5IHRvIGhhdmUgYSBuZXcgc2VyaWVzIGJ5IHRvbW9ycm93LgoKQ2hlZXJzLApSaWNh
cmRvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
