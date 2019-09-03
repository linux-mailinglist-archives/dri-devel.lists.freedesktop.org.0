Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A06F9A6127
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 08:17:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8882C89755;
	Tue,  3 Sep 2019 06:17:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E0C89755
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 06:17:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 04868315C00C;
 Tue,  3 Sep 2019 06:17:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-67.ams2.redhat.com
 [10.36.117.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8ECA060A9F;
 Tue,  3 Sep 2019 06:17:16 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5037A46D3; Tue,  3 Sep 2019 08:17:15 +0200 (CEST)
Date: Tue, 3 Sep 2019 08:17:15 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/5] drm/vram: use drm_gem_ttm_print_info
Message-ID: <20190903061715.5rwdcnt3h77lybi7@sirius.home.kraxel.org>
References: <20190902124126.7700-1-kraxel@redhat.com>
 <20190902124126.7700-3-kraxel@redhat.com>
 <c3cd7018-b7a1-a0e0-c08b-26fbddca1f92@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c3cd7018-b7a1-a0e0-c08b-26fbddca1f92@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Tue, 03 Sep 2019 06:17:17 +0000 (UTC)
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICBIaSwKCj4gPiBAQCAtMTY5LDYgKzE2OSw3IEBAIGNvbmZpZyBEUk1fVlJBTV9IRUxQRVIKPiA+
ICAJdHJpc3RhdGUKPiA+ICAJZGVwZW5kcyBvbiBEUk0KPiA+ICAJc2VsZWN0IERSTV9UVE0KPiA+
ICsJc2VsZWN0IERSTV9UVE1fSEVMUEVSCj4gCj4gSSB0aG91Z2h0IHRoYXQgVlJBTSBoZWxwZXJz
IGFscmVhZHkgZGVwZW5kIG9uIFRUTSBoZWxwZXJzLgoKTm8sIHRoZXkgZG9uJ3QuICBQYXRjaCAj
MSBhZGRzIHRoZW0gOykKCmNoZWVycywKICBHZXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
