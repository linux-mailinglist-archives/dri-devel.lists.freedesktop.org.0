Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C19A104192
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 17:55:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F09A6E940;
	Wed, 20 Nov 2019 16:55:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B31796E940
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 16:55:35 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F40E62071F;
 Wed, 20 Nov 2019 16:55:34 +0000 (UTC)
Date: Wed, 20 Nov 2019 17:55:33 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 devel@driverdev.osuosl.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] staging: fbtft: Fix Kconfig indentation
Message-ID: <20191120165533.GA3027865@kroah.com>
References: <20191120133911.13539-1-krzk@kernel.org>
 <20191120164155.GR30416@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191120164155.GR30416@phenom.ffwll.local>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1574268935;
 bh=8FrHjGta+6jwWJXLwHTgBvG6rHWnBmFRWE1CWfOKi2I=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=GuaUCGXRy69UGMILRhEiXMQht7KknaeqSwn+pkg/GnFmDDi44IhBbx08jJcgAkU5O
 JKaj0sp6QY8rmyw6QWibarbtgNwmXj76E/oNNTaTytyuju0eZnU6EensCUxr+w/3tG
 vlm6pFo8SE7DrAHPxscB+DzfIitfTsBVG8quudHE=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMDU6NDE6NTVQTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBXZWQsIE5vdiAyMCwgMjAxOSBhdCAwOTozOToxMVBNICswODAwLCBLcnp5c3p0
b2YgS296bG93c2tpIHdyb3RlOgo+ID4gQWRqdXN0IGluZGVudGF0aW9uIGZyb20gc3BhY2VzIHRv
IHRhYiAoK29wdGlvbmFsIHR3byBzcGFjZXMpIGFzIGluCj4gPiBjb2Rpbmcgc3R5bGUgd2l0aCBj
b21tYW5kIGxpa2U6Cj4gPiAJJCBzZWQgLWUgJ3MvXiAgICAgICAgL1x0LycgLWkgKi9LY29uZmln
Cj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVs
Lm9yZz4KPiAKPiBBY2tlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5j
aD4KPiAKPiBJIGV4cGVjdCBHcmVnIHdpbGwgcGljayB0aGlzIHVwLgoKQWxyZWFkeSBwaWNrZWQg
dXAgOikKCnRoYW5rcyBmb3IgdGhlIHJldmlldywKCmdyZWcgay1oCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
