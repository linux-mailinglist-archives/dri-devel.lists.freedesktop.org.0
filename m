Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A75819E2
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 14:46:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18DEC6E406;
	Mon,  5 Aug 2019 12:46:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE40A6E406;
 Mon,  5 Aug 2019 12:45:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7BF1081DEC;
 Mon,  5 Aug 2019 12:45:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-81.ams2.redhat.com
 [10.36.116.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A4B56012D;
 Mon,  5 Aug 2019 12:45:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 63FC29D00; Mon,  5 Aug 2019 14:45:57 +0200 (CEST)
Date: Mon, 5 Aug 2019 14:45:57 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 11/18] [fixup] ttm
Message-ID: <20190805124557.eazqln75mqm2ms63@sirius.home.kraxel.org>
References: <20190805124310.3275-1-kraxel@redhat.com>
 <20190805124310.3275-12-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190805124310.3275-12-kraxel@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Mon, 05 Aug 2019 12:45:58 +0000 (UTC)
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
Cc: thomas@shipmail.org, tzimmermann@suse.de, David Airlie <airlied@linux.ie>,
 ckoenig.leichtzumerken@gmail.com, intel-gfx@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Huang Rui <ray.huang@amd.com>,
 bskeggs@redhat.com, Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMDUsIDIwMTkgYXQgMDI6NDM6MDNQTSArMDIwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyB8IDIgKy0KPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV9iby5jCj4gaW5kZXggYjNkNjI4YjNmMDM4Li43M2Q0MDc0OTQ1ODYgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX2JvLmMKPiBAQCAtOTYxLDcgKzk2MSw3IEBAIHN0YXRpYyBpbnQgdHRtX2JvX21lbV9mb3Jj
ZV9zcGFjZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+ICAJc3RydWN0IHd3X2FjcXVp
cmVfY3R4ICp0aWNrZXQ7Cj4gIAlpbnQgcmV0Owo+ICAKPiAtCXRpY2tldCA9IHJlc2VydmF0aW9u
X29iamVjdF9sb2NraW5nX2N0eChiby0+cmVzdik7Cj4gKwl0aWNrZXQgPSByZXNlcnZhdGlvbl9v
YmplY3RfbG9ja2luZ19jdHgoYm8tPmJhc2UucmVzdik7Cj4gIAlkbyB7Cj4gIAkJcmV0ID0gKCpt
YW4tPmZ1bmMtPmdldF9ub2RlKShtYW4sIGJvLCBwbGFjZSwgbWVtKTsKPiAgCQlpZiAodW5saWtl
bHkocmV0ICE9IDApKQoKT29wcy4gIFRoaXMgaXMgbWVhbnQgdG8gYmUgc3F1YXNoZWQgaW50byAx
MC8xOCBvZiBjb3Vyc2UuCgpjaGVlcnMsCiAgR2VyZAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
