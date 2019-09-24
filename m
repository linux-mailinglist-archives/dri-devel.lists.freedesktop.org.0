Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC0DBC26F
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 09:18:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C07389D8D;
	Tue, 24 Sep 2019 07:18:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3765F89D8D
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 07:18:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8CE42368E2;
 Tue, 24 Sep 2019 07:18:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com
 [10.36.116.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B3B9E5FCB8;
 Tue, 24 Sep 2019 07:18:10 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 87F7516E05; Tue, 24 Sep 2019 09:18:09 +0200 (CEST)
Date: Tue, 24 Sep 2019 09:18:09 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 01/12] drm/vram: Support top-down placement flag
Message-ID: <20190924071809.ediliko4wt2ngqgf@sirius.home.kraxel.org>
References: <20190923172753.26593-1-tzimmermann@suse.de>
 <20190923172753.26593-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190923172753.26593-2-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Tue, 24 Sep 2019 07:18:11 +0000 (UTC)
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
Cc: corbet@lwn.net, airlied@linux.ie, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICBIaSwKCj4gKyAqIG9iamVjdCB0byBiZSBwaW5uZWQgYXQgdGhlIGhpZ2ggZW5kIG9mIHRoZSBt
ZW1vcnkgcmVnaW9uLiBTZXQgdGhpcwo+ICsgKiBmbGFnIHRvIGF2b2lkIG1lbW9yeSBmcmFnbWVu
dGF0aW9uLgoKVGhhdCBpcyBjb25mdXNpbmcsIHNvdW5kcyBsaWtlIHRoZSBmbGFnIHNob3VsZCBi
ZSBzZXQgb24gYWxsIG9iamVjdHMKd2hpY2ggaXMgbm90IGNvcnJlY3QuICBUaGUgZGVzY3JpcHRp
b24gZnJvbSB0aGUgY292ZXIgbGV0dGVyIGlzIGJldHRlci4KCk90aGVyd2lzZSB0aGUgcGF0Y2gg
aXMgZmluZSwgc28gd2l0aCB0aGF0IGZpeGVkOgpSZXZpZXdlZC1ieTogR2VyZCBIb2ZmbWFubiA8
a3JheGVsQHJlZGhhdC5jb20+CgpjaGVlcnMsCiAgR2VyZAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
