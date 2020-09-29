Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDD227D273
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 17:15:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B026B6E200;
	Tue, 29 Sep 2020 15:14:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F15426E415;
 Tue, 29 Sep 2020 15:14:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 78C88AE85;
 Tue, 29 Sep 2020 15:14:46 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, sam@ravnborg.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, kraxel@redhat.com, l.stach@pengutronix.de,
 linux+etnaviv@armlinux.org.uk, christian.gmeiner@gmail.com,
 inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org,
 yuq825@gmail.com, bskeggs@redhat.com, robh@kernel.org,
 tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, hjc@rock-chips.com, heiko@sntech.de,
 hdegoede@redhat.com, sean@poorly.run, eric@anholt.net,
 oleksandr_andrushchenko@epam.com, ray.huang@amd.com,
 sumit.semwal@linaro.org, emil.velikov@collabora.com, luben.tuikov@amd.com,
 apaneers@amd.com, linus.walleij@linaro.org, melissa.srw@gmail.com,
 chris@chris-wilson.co.uk, miaoqinglang@huawei.com
Subject: [PATCH v3 7/7] drm/todo: Update entries around struct dma_buf_map
Date: Tue, 29 Sep 2020 17:14:37 +0200
Message-Id: <20200929151437.19717-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200929151437.19717-1-tzimmermann@suse.de>
References: <20200929151437.19717-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 xen-devel@lists.xenproject.org, spice-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5zdGFuY2VzIG9mIHN0cnVjdCBkbWFfYnVmX21hcCBzaG91bGQgYmUgdXNlZnVsIHRocm91Z2hv
dXQgRFJNJ3MKbWVtb3J5IG1hbmFnZW1lbnQgY29kZS4gRnVydGhlcm1vcmUsIHNldmVyYWwgZHJp
dmVycyBjYW4gbm93IHVzZQpnZW5lcmljIGZiZGV2IGVtdWxhdGlvbi4KClNpZ25lZC1vZmYtYnk6
IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgotLS0KIERvY3VtZW50YXRp
b24vZ3B1L3RvZG8ucnN0IHwgMjQgKysrKysrKysrKysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hh
bmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2dwdS90b2RvLnJzdCBiL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0CmluZGV4
IDM3NTFhYzk3NmMzZS4uMDIzNjI2YzE4MzdiIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2dw
dS90b2RvLnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdApAQCAtMTk3LDggKzE5
NywxMCBAQCBDb252ZXJ0IGRyaXZlcnMgdG8gdXNlIGRybV9mYmRldl9nZW5lcmljX3NldHVwKCkK
IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogCiBNb3N0
IGRyaXZlcnMgY2FuIHVzZSBkcm1fZmJkZXZfZ2VuZXJpY19zZXR1cCgpLiBEcml2ZXIgaGF2ZSB0
byBpbXBsZW1lbnQKLWF0b21pYyBtb2Rlc2V0dGluZyBhbmQgR0VNIHZtYXAgc3VwcG9ydC4gQ3Vy
cmVudCBnZW5lcmljIGZiZGV2IGVtdWxhdGlvbgotZXhwZWN0cyB0aGUgZnJhbWVidWZmZXIgaW4g
c3lzdGVtIG1lbW9yeSAob3Igc3lzdGVtLWxpa2UgbWVtb3J5KS4KK2F0b21pYyBtb2Rlc2V0dGlu
ZyBhbmQgR0VNIHZtYXAgc3VwcG9ydC4gSGlzdG9yaWNhbGx5LCBnZW5lcmljIGZiZGV2IGVtdWxh
dGlvbgorZXhwZWN0ZWQgdGhlIGZyYW1lYnVmZmVyIGluIHN5c3RlbSBtZW1vcnkgb3Igc3lzdGVt
LWxpa2UgbWVtb3J5LiBCeSBlbXBsb3lpbmcKK3N0cnVjdCBkbWFfYnVmX21hcCwgZHJpdmVycyB3
aXRoIGZyYW1idWZmZXJzIGluIEkvTyBtZW1vcnkgY2FuIGJlIHN1cHBvcnRlZAorYXMgd2VsbC4K
IAogQ29udGFjdDogTWFpbnRhaW5lciBvZiB0aGUgZHJpdmVyIHlvdSBwbGFuIHRvIGNvbnZlcnQK
IApAQCAtNDQ2LDYgKzQ0OCwyNCBAQCBDb250YWN0OiBWaWxsZSBTeXJqw6Rsw6QsIERhbmllbCBW
ZXR0ZXIKIAogTGV2ZWw6IEludGVybWVkaWF0ZQogCitVc2Ugc3RydWN0IGRtYV9idWZfbWFwIHRo
cm91Z2hvdXQgY29kZWJhc2UKKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQorCitQb2ludGVycyB0byBzaGFyZWQgZGV2aWNlIG1lbW9yeSBhcmUgc3RvcmVkIGluIHN0
cnVjdCBkbWFfYnVmX21hcC4gRWFjaAoraW5zdGFuY2Uga25vd3Mgd2hldGhlciBpdCByZWZlcnMg
dG8gc3lzdGVtIG9yIEkvTyBtZW1vcnkuIE1vc3Qgb2YgdGhlIERSTS13aWRlCitpbnRlcmZhY2Ug
aGF2ZSBiZWVuIGNvbnZlcnRlZCB0byB1c2Ugc3RydWN0IGRtYV9idWZfbWFwLCBidXQgaW1wbGVt
ZW50YXRpb25zCitvZnRlbiBzdGlsbCB1c2UgcmF3IHBvaW50ZXJzLgorCitUaGUgdGFzayBpcyB0
byB1c2Ugc3RydWN0IGRtYV9idWZfbWFwIHdoZXJlIGl0IG1ha2VzIHNlbnNlLgorCisqIE1lbW9y
eSBtYW5hZ2VycyBzaG91bGQgdXNlIHN0cnVjdCBkbWFfYnVmX21hcCBmb3IgZG1hLWJ1Zi1pbXBv
cnRlZCBidWZmZXJzLgorKiBUVE0gbWlnaHQgYmVuZWZpdCBmcm9tIHVzaW5nIHN0cnVjdCBkbWFf
YnVmX21hcCBpbnRlcm5hbGx5LgorKiBGcmFtZWJ1ZmZlciBjb3B5aW5nIGFuZCBibGl0dGluZyBo
ZWxwZXJzIHNob3VsZCBvcGVyYXRlIG9uIHN0cnVjdCBkbWFfYnVmX21hcC4KKworQ29udGFjdDog
VGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+LCBDaHJpc3RpYW4gS8O2bmln
LCBEYW5pZWwgVmV0dGVyCisKK0xldmVsOiBJbnRlcm1lZGlhdGUKKwogCiBDb3JlIHJlZmFjdG9y
aW5ncwogPT09PT09PT09PT09PT09PT0KLS0gCjIuMjguMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
