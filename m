Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E1F285952
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 09:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C2AE6E0C9;
	Wed,  7 Oct 2020 07:22:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net
 [IPv6:2001:a60:0:28:0:1:25:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 639006E5CF
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 22:38:54 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4C5XSX1sClz1rv9g;
 Wed,  7 Oct 2020 00:38:52 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4C5XSW6YxPz1qql9;
 Wed,  7 Oct 2020 00:38:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id ABVKqHAZamke; Wed,  7 Oct 2020 00:38:50 +0200 (CEST)
X-Auth-Info: CsLfSM+tnMCckdGepalMEaPqQlKK9EF+AaeL4ZPldz0=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed,  7 Oct 2020 00:38:50 +0200 (CEST)
Subject: Re: [PATCH] dt-bindings: mxsfb: Add compatible for i.MX8MM
To: Rob Herring <robh@kernel.org>
References: <20201003224801.164112-1-marex@denx.de>
 <20201006211508.GA2853753@bogus>
From: Marek Vasut <marex@denx.de>
Message-ID: <16d91fb6-608f-a199-e3bf-99c5d7b85497@denx.de>
Date: Wed, 7 Oct 2020 00:38:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201006211508.GA2853753@bogus>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 07 Oct 2020 07:22:33 +0000
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
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvNi8yMCAxMToxNSBQTSwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gU3VuLCAwNCBPY3Qg
MjAyMCAwMDo0ODowMSArMDIwMCwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+IE5YUCdzIGkuTVg4TU0g
aGFzIGFuIExDRElGIGFzIHdlbGwuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIFZhc3V0IDxt
YXJleEBkZW54LmRlPgo+PiBDYzogRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPgo+
PiBDYzogR3VpZG8gR8O8bnRoZXIgPGFneEBzaWd4Y3B1Lm9yZz4KPj4gQ2M6IEx1Y2FzIFN0YWNo
IDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPgo+PiBDYzogTlhQIExpbnV4IFRlYW0gPGxpbnV4LWlt
eEBueHAuY29tPgo+PiBDYzogUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz4KPj4gQ2M6
IFNoYXduIEd1byA8c2hhd25ndW9Aa2VybmVsLm9yZz4KPj4gLS0tCj4+ICBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9teHNmYi50eHQgfCAxICsKPj4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Pgo+IAo+IEFja2VkLWJ5OiBSb2IgSGVycmluZyA8cm9i
aEBrZXJuZWwub3JnPgo+IAo+IFRob3VnaCBMYXVyZW50IHBvc3RlZCBjb252ZXJ0aW5nIHRoaXMg
dG8gc2NoZW1hLi4uCgpEbyB5b3Ugd2FudCBtZSB0byByZWJhc2UgdGhpcyBvbiB0b3Agb2YgaXQg
b3IgdGhlIG90aGVyIHdheSBhcm91bmQgPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
