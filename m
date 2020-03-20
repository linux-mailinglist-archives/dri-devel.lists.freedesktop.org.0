Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FC818CDCD
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 13:21:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 132B26E14B;
	Fri, 20 Mar 2020 12:21:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F5E89265
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 12:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x50l/sk5zd5paFFA3ajk8EyOXhGzLL5WALi6QEatlVE=; b=R8xHqtKqqR07OlImYd06alORCe
 CZxY2Ljh9KKWwGGAakhP3TtYCbXvdOAxOHGIqzxfOLTLkZ5hHDPfEZsZItFFJki7SZWNOUaeMi75c
 Ke13Jimlo0bHjhJdnXlptn8QEgUdVEOBegwtZzPf59V6QzMjeLyU/XCVjrFNBAY19n1ji0O9Veo6P
 VHZq2dM7Cw026dRl/7scNHn/Cuk/shVcVOLpplWH1JTxCvjnXf3dycgItg+OsHNt9gOuob5rTpzLK
 40/Z5a0Y1Xwjh33N51hGAdZQyVvT+LDwqHO0O1Uc8L7ZFX7fjiJ64EQvlNllSgGvHwdq6kJmKOcCa
 xl7XjFQA==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:51023
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1jFGeE-00046l-Qp; Fri, 20 Mar 2020 13:21:10 +0100
Subject: Re: [PATCH 1/2] drm/client: Dual licence the header in GPL-2 and MIT
To: Emmanuel Vadot <manu@FreeBSD.org>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
 matthew.d.roper@intel.com, kraxel@redhat.com, tglx@linutronix.de
References: <20200320022114.2234-1-manu@FreeBSD.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <5105e75b-3016-13d8-cbaf-1b3e9ecfaeb4@tronnes.org>
Date: Fri, 20 Mar 2020 13:21:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200320022114.2234-1-manu@FreeBSD.org>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMjAuMDMuMjAyMCAwMy4yMSwgc2tyZXYgRW1tYW51ZWwgVmFkb3Q6Cj4gU291cmNlIGZp
bGUgd2FzIGR1YWwgbGljZW5jZWQgYnV0IHRoZSBoZWFkZXIgd2FzIG9taXR0ZWQsIGZpeCB0aGF0
Lgo+IENvbnRyaWJ1dG9ycyBmb3IgdGhpcyBmaWxlIGFyZToKPiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWwudmV0dGVyQGZmd2xsLmNoPgo+IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5j
b20+Cj4gTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPgo+IE5vcmFsZiBUcsO4bm5l
cyA8bm9yYWxmQHRyb25uZXMub3JnPgo+IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBz
dXNlLmRlPgo+IAo+IFNpZ25lZC1vZmYtYnk6IEVtbWFudWVsIFZhZG90IDxtYW51QEZyZWVCU0Qu
b3JnPgo+IC0tLQoKQWNrZWQtYnk6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3Jn
PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
