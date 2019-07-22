Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6226FE9F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 13:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 565AF89C3F;
	Mon, 22 Jul 2019 11:20:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A61E89C46
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 11:20:39 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:56901
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hpWMv-00047E-M5; Mon, 22 Jul 2019 13:20:37 +0200
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Subject: Need 5.3-rc1 in drm-misc-next
Message-ID: <918c1fbb-4fbb-d4a4-0508-367234bb6dda@tronnes.org>
Date: Mon, 22 Jul 2019 13:20:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:Subject:From:Cc:To;
 bh=48ohMah36razgIaFLIqUt/sr6P1Pe8zi+kyHsq5uLjg=; 
 b=qi4cZWXwQNKsRl2Tvs+Nx713MNGSZnPt0VHOmjTgZ10wk65C1mU9DRx3QY9vTv29KIYpF/eDvJTQX2yh6eThKok8zodpZhPhsbnc69LSi5h5DmuWEfIvZgCtQ7HWP4qa6nHs6iTZ7gq02ZLc6G6bmmlI2GMx/qM21EDTpS1e7Ym0rdDxba24QSQDFft5Z4QpoPflMXPXOSqRt/u6dRQxiu+990z7ZH1LYjnA0Vz5gKtybyyEJvRJgdfjHnhKVnIr/q6bphanb6stmL61mA8PWR6RXMQlTW4IgT42mx5BTg+AfMx8RQ1JT/lY8KXvilE9DuN6l/WYtvI4Wr6dz2WUtg==;
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgZHJtLW1pc2MgbWFpbnRhaW5lcnMsCgpJIGhhdmUgdGhpcyBzZXJpZXM6Cgpkcm0vdGlueWRy
bTogUmVtb3ZlIHRpbnlkcm0ua28KaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nl
cmllcy82MzgxMS8KClRoYXQgZGVwZW5kcyBvbiB0aGlzIC1yYzEgY29tbWl0OgoKZTZmM2Y3ZTRk
Yzc2ICgic3BpOiBBZGQgc3BpX2lzX2Jwd19zdXBwb3J0ZWQoKSIpCgpJIHdvdWxkIHdvdWxkIGJl
IG5pY2UgaWYgaXQgd291bGQgc2hvdyB1cCBpbiBkcm0tbWlzYy1uZXh0IHNvb24uCgpOb3JhbGYu
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
