Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE5428624E
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 17:39:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 102416E91B;
	Wed,  7 Oct 2020 15:39:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1BE6E241
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 08:42:49 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4C5nsN1Fc6z1r7lG;
 Wed,  7 Oct 2020 10:42:48 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4C5nsN0Nggz1qrgR;
 Wed,  7 Oct 2020 10:42:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id T83v4yqXBIXr; Wed,  7 Oct 2020 10:42:46 +0200 (CEST)
X-Auth-Info: LUl0AwYZLW2wjfAFYJkd/Ml8BfRXgrUQNmRPgN2WS0U=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed,  7 Oct 2020 10:42:46 +0200 (CEST)
Subject: Re: [PATCH] dt-bindings: mxsfb: Add compatible for i.MX8MM
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20201003224801.164112-1-marex@denx.de>
 <20201006211508.GA2853753@bogus>
 <16d91fb6-608f-a199-e3bf-99c5d7b85497@denx.de>
 <20201007004233.GA30598@pendragon.ideasonboard.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <cf3b64dc-9bc0-79cc-d850-b714bb1fba12@denx.de>
Date: Wed, 7 Oct 2020 10:42:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201007004233.GA30598@pendragon.ideasonboard.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 07 Oct 2020 15:39:39 +0000
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
Cc: devicetree@vger.kernel.org,
 =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvNy8yMCAyOjQyIEFNLCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOgo+IEhpIE1hcmVrLAo+
IAo+IE9uIFdlZCwgT2N0IDA3LCAyMDIwIGF0IDEyOjM4OjUwQU0gKzAyMDAsIE1hcmVrIFZhc3V0
IHdyb3RlOgo+PiBPbiAxMC82LzIwIDExOjE1IFBNLCBSb2IgSGVycmluZyB3cm90ZToKPj4+IE9u
IFN1biwgMDQgT2N0IDIwMjAgMDA6NDg6MDEgKzAyMDAsIE1hcmVrIFZhc3V0IHdyb3RlOgo+Pj4+
IE5YUCdzIGkuTVg4TU0gaGFzIGFuIExDRElGIGFzIHdlbGwuCj4+Pj4KPj4+PiBTaWduZWQtb2Zm
LWJ5OiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4KPj4+PiBDYzogRmFiaW8gRXN0ZXZhbSA8
ZmVzdGV2YW1AZ21haWwuY29tPgo+Pj4+IENjOiBHdWlkbyBHw7xudGhlciA8YWd4QHNpZ3hjcHUu
b3JnPgo+Pj4+IENjOiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4KPj4+PiBD
YzogTlhQIExpbnV4IFRlYW0gPGxpbnV4LWlteEBueHAuY29tPgo+Pj4+IENjOiBSb2IgSGVycmlu
ZyA8cm9iaCtkdEBrZXJuZWwub3JnPgo+Pj4+IENjOiBTaGF3biBHdW8gPHNoYXduZ3VvQGtlcm5l
bC5vcmc+Cj4+Pj4gLS0tCj4+Pj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L214c2ZiLnR4dCB8IDEgKwo+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KykKPj4+Pgo+Pj4KPj4+IEFja2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+
Pj4KPj4+IFRob3VnaCBMYXVyZW50IHBvc3RlZCBjb252ZXJ0aW5nIHRoaXMgdG8gc2NoZW1hLi4u
Cj4+Cj4+IERvIHlvdSB3YW50IG1lIHRvIHJlYmFzZSB0aGlzIG9uIHRvcCBvZiBpdCBvciB0aGUg
b3RoZXIgd2F5IGFyb3VuZCA/Cj4gCj4gV291bGQgaXQgYmUgT0sgaWYgSSByZWJhc2VkIHRoaXMg
b24gdG9wIG9mIHRoZSBjb252ZXJzaW9uLCBhbmQgaW5jbHVkZWQKPiBpdCBpbiB0aGUgdjIgb2Yg
dGhlIG14c2ZiIHNlcmllcyA/CgpZZXMsIG9yIGp1c3Qgc3F1YXNoIGl0IGludG8gMi83Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
