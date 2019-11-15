Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB03FE027
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 15:33:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 949F76E60D;
	Fri, 15 Nov 2019 14:33:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFDDD6E60D
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 14:33:53 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:54035
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1iVcfX-0008QT-Do; Fri, 15 Nov 2019 15:33:51 +0100
Subject: Re: drm core/helpers and MIT license
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 coypu@sdf.org
References: <20191114200132.GA11077@SDF.ORG> <20191115123432.GB1208@intel.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <f6629560-6b95-c125-a1d5-51554b2a1dab@tronnes.org>
Date: Fri, 15 Nov 2019 15:33:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191115123432.GB1208@intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org
 ; s=ds201810; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dE+a1ig/3RZarqZ9FSj33vBEFVaiKyqpYHO+cUvvCOc=; b=eWNGFln1iYV6taMHCPvgNvuHB2
 T2Lunv7/adMSdPkiotwtxACv1qNm64Ps0XTsZJIyjkfZnXrxpNLZ8gReM64Z/6PF43ipiHgf8RVP0
 mJenSAjgwx/5zuPeYwQ+kwHe8m6tcfc75F0ae15t0je7pgS2QImH8rm8J1UTph6XK53KfUqVpQo4F
 4O2zXclw9xUA8K3H29BFdp4ojXSy9ffRuqf7U1bJOIJsU9b6LQawh3Ff0mxMTixDEJQwYbuwULvnk
 WhJZsXyQPDtWHWSnoR0uUji1J7GtBVKsvsUyqSmaKH7XBeFy9MuwQklpBhDZ0arhseCORALHR0NQQ
 JfRfz0Jg==;
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTUuMTEuMjAxOSAxMy4zNCwgc2tyZXYgVmlsbGUgU3lyasOkbMOkOgo+IE9uIFRodSwg
Tm92IDE0LCAyMDE5IGF0IDA4OjAxOjMyUE0gKzAwMDAsIGNveXB1QHNkZi5vcmcgd3JvdGU6Cj4+
IEhpIERhbmllbCwKPj4KPj4gSSBkb24ndCB0aGluayB3ZSBjYW4gbWFrZSBhbnkgY29tcGxhaW50
cyBhYm91dCBHUEwgYmVpbmcgbW9yZSB3aWRlbHkKPj4gdXNlZCBpbiB0aGUgRFJNIGNvZGUuIEl0
J3MgbmljZSB0byBoYXZlIHRoZSBjb2RlIGF0IGFsbCwgdGhlIE1JVCBsaWNlbnNlCj4+IGlzIGEg
Ym9udXMuIFRoYW5rcyBmb3Igd3JpdGluZyBpdCBhbmQgYmVhcmluZyB3aXRoIHVzLgo+Pgo+PiBX
b3VsZCByZXdyaXRlcyBkb25lIHB1cmVseSBmb3IgbGljZW5zaW5nIHJlYXNvbnMgYmUgYWNjZXB0
ZWQgdXBzdHJlYW0/Cj4gCj4gUmV3cml0ZSBzaG91bGQgYmUgdGhlIGxhc3QgcmVzb3J0LiBJIHRo
aW5rIGEgbG90IG9mIHRoZSBHUEwgb25seSBzdHVmZgo+IGlzIHF1aXRlIHJlY2VudCBzbyB0aGVy
ZSdzIGEgZ29vZCBjaGFuY2UgdGhlIGF1dGhvcihzKSBhcmUgc3RpbGwgYXJvdW5kCj4gdG8gZGlz
Y3VzcyByZWxpY2Vuc2luZy4KPiAKCklmIHNvbWVvbmUgc2VuZHMgcGF0Y2hlcyB0byBNSVQgbGlj
ZW5zZSB0aGUgd29yayBJJ3ZlIGRvbmUsIEknbGwgYmUKaGFwcHkgdG8gYWNrIGl0LiBJdCdzIG9u
bHkgcmVjZW50bHkgdGhhdCBJJ3ZlIGJlZW4gYXdhcmUgb2YgdGhlIGZhY3QKdGhhdCBNSVQgbGlj
ZW5zZWQgd2FzIGEgdGhpbmcgaW4gdGhlIGtlcm5lbC4gSSB3YXMgdW5kZXIgdGhlIGltcHJlc3Np
b24KdGhhdCBhbGwgbmV3IGNvZGUgc2hvdWxkIGJlIEdQTCBhbmQgTUlUIHdlcmUgZm9yIGNvZGUg
aW1wb3J0ZWQgZnJvbQplbHNld2hlcmUuIEkgd291bGQgbG92ZSB0byBzZWUgbXkgd29yayBiZWlu
ZyB1c2VkIG9uIHRoZSBCU0Qncy4KCk5vcmFsZi4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
