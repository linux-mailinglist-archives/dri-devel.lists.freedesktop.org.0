Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E1D70A12
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 21:51:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA5C89E11;
	Mon, 22 Jul 2019 19:51:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A3B689E11
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 19:51:30 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:60773
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hpeLI-0001nF-Es; Mon, 22 Jul 2019 21:51:28 +0200
Subject: Re: Need 5.3-rc1 in drm-misc-next
To: Maxime Ripard <maxime.ripard@bootlin.com>
References: <918c1fbb-4fbb-d4a4-0508-367234bb6dda@tronnes.org>
 <20190722194409.rrabgelrriyjg364@flea>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <d81b17c6-9d13-5241-2900-2786bd066adb@tronnes.org>
Date: Mon, 22 Jul 2019 21:51:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190722194409.rrabgelrriyjg364@flea>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=vPtxSvGv+uceDVmNDx1t7nf+iY65KGfzxyPfjiInzYE=; 
 b=SiXjs4/H8I+CfiNFgagSjq4X1+9zFtbygqWvoQXS+/ydYeHOLv71d/pdxcvOjP6+EzmoV5XpgnhStP5UQPwplfopZy3XNtxRpn78cDsn8e0JDn2mAl9Ajl2j62w0mIiN6OIZScNRB8yumtE1OEvcZPhNIqn03Yfs3MS5q1u0aATrvXUeeUiRAvJ6mE2Y6cVqJ7bdOqDt35B2b9lY/qjLHVZH5A3hYSbzrWjxL+pf6xXFNtdcn06t3OGn+LXM/AKGo8VTfvAYFcQFuONPfgWeIXOsbAZQs4BzvEqaZuphXIaos9/oi3yEsh94D+uqpGvRIF40hf5u5uLPMNBwEaaU6g==;
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
Cc: Sean Paul <sean@poorly.run>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMjIuMDcuMjAxOSAyMS40NCwgc2tyZXYgTWF4aW1lIFJpcGFyZDoKPiBIaSEKPiAKPiBP
biBNb24sIEp1bCAyMiwgMjAxOSBhdCAwMToyMDozNVBNICswMjAwLCBOb3JhbGYgVHLDuG5uZXMg
d3JvdGU6Cj4+IEhpIGRybS1taXNjIG1haW50YWluZXJzLAo+Pgo+PiBJIGhhdmUgdGhpcyBzZXJp
ZXM6Cj4+Cj4+IGRybS90aW55ZHJtOiBSZW1vdmUgdGlueWRybS5rbwo+PiBodHRwczovL3BhdGNo
d29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzYzODExLwo+Pgo+PiBUaGF0IGRlcGVuZHMgb24g
dGhpcyAtcmMxIGNvbW1pdDoKPj4KPj4gZTZmM2Y3ZTRkYzc2ICgic3BpOiBBZGQgc3BpX2lzX2Jw
d19zdXBwb3J0ZWQoKSIpCj4+Cj4+IEkgd291bGQgd291bGQgYmUgbmljZSBpZiBpdCB3b3VsZCBz
aG93IHVwIGluIGRybS1taXNjLW5leHQgc29vbi4KPiAKPiBJIGp1c3QgZGlkIGl0Cj4gCgpUaGFu
a3MgTWF4aW1lLCB0aGF0IHdhcyBmYXN0IQoKTm9yYWxmLgoKPiBNYXhpbWUKPiAKPiAtLQo+IE1h
eGltZSBSaXBhcmQsIEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVy
aW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
