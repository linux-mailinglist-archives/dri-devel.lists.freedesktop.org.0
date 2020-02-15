Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D26B415FFBB
	for <lists+dri-devel@lfdr.de>; Sat, 15 Feb 2020 19:39:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF666E901;
	Sat, 15 Feb 2020 18:39:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE8456E901
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2020 18:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5/19AUsXQSsM+Vl14HjA0kAidLjQ78I398OHdWF5mXY=; b=hKlxHnr3r7kEmwppY5QswZF8zA
 sJKNSj+9WC7QiX3xHgpxS3j26U4qBu0oBgHY6AZIfUH4qyJRl5RFwAQgOQbZVAx1vt72ANjsJPlfN
 aTtbzGewdhgjZ/osQzjFbznl+mv5jGf56QE8bnJqHXoLBPpSTSqEKwy0mrpH2Uig2KIzhT8nMCyn1
 13GDeYqx9KhU/7mj7zCK2UY17m/IQOOrPvIDTKljJqInhqwiE0J+xIMRFZKlIdYC1pAg5csmkZZY0
 DwmJk4Ppou3YjvdyylhhSY4mF/e2fComDGcTL+Zja74GZw7y962RHp9cXjxZimPrtoh6R2Gmq33Jr
 k/jtYQ5A==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:53545
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1j32M2-0005Bc-69; Sat, 15 Feb 2020 19:39:50 +0100
Subject: Re: [PATCH v2 2/2] drm/format_helper: Dual licence the file in GPL 2
 and MIT
To: Emmanuel Vadot <manu@FreeBSD.org>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@linux.ie, daniel@ffwll.ch,
 jani.nikula@intel.com, efremov@linux.com, tzimmermann@suse.de,
 sam@ravnborg.org, chris@chris-wilson.co.uk, kraxel@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20200215180911.18299-1-manu@FreeBSD.org>
 <20200215180911.18299-3-manu@FreeBSD.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <5472091e-7b98-7742-c04f-704fb138d1f8@tronnes.org>
Date: Sat, 15 Feb 2020 19:39:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200215180911.18299-3-manu@FreeBSD.org>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTUuMDIuMjAyMCAxOS4wOSwgc2tyZXYgRW1tYW51ZWwgVmFkb3Q6Cj4gRnJvbTogRW1t
YW51ZWwgVmFkb3QgPG1hbnVARnJlZUJTRC5Pcmc+Cj4gCj4gQ29udHJpYnV0b3JzIGZvciB0aGlz
IGZpbGUgYXJlIDoKPiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KPiBNYXhpbWUg
UmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+Cj4gTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJv
bm5lcy5vcmc+Cj4gCj4gU2lnbmVkLW9mZi1ieTogRW1tYW51ZWwgVmFkb3QgPG1hbnVARnJlZUJT
RC5vcmc+Cj4gLS0tCgpBY2tlZC1ieTogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5v
cmc+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
