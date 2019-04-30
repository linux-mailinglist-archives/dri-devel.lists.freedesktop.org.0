Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3715BF0E6
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2019 09:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79745893E7;
	Tue, 30 Apr 2019 07:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F2289254;
 Tue, 30 Apr 2019 07:08:32 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Apr 2019 00:08:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,412,1549958400"; d="scan'208";a="138638895"
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost)
 ([10.251.88.66])
 by orsmga008.jf.intel.com with ESMTP; 30 Apr 2019 00:08:21 -0700
Date: Tue, 30 Apr 2019 10:08:20 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next-fixes
Message-ID: <20190430070820.GA7967@jlahtine-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.11.3 (2019-02-01)
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
Cc: dim-tools@lists.freedesktop.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSAmIERhbmllbCwKCkp1c3Qgb25lIGZpeCB0byBmaXggSWNlbGFrZSBDU0MgcHJvZ3Jh
bW1pbmcgKGZpeGVzIGxvc3Mgb2YgYmx1ZSBjaGFubmVsKS4KCkJlc3QgUmVnYXJkcywgSm9vbmFz
CgoqKioKCmRybS1pbnRlbC1uZXh0LWZpeGVzLTIwMTktMDQtMzA6CgotIEZpeCB0byBJY2VsYWtl
IENTQyBsb3NpbmcgYmx1ZSBjaGFubmVsCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29t
bWl0IDQ0NzgxMWE2ODZlOGRhNzMyNTUxNmE3ODA2OWNjZmJkMTM5ZWYxYTc6CgogIGRybS9pOTE1
L2ljbDogRml4IE1HX0RQX01PREUoKSByZWdpc3RlciBwcm9ncmFtbWluZyAoMjAxOS0wNC0yNCAw
OTozOToxMSArMDMwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoK
ICBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtLWludGVsIHRhZ3MvZHJtLWlu
dGVsLW5leHQtZml4ZXMtMjAxOS0wNC0zMAoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRv
IDg3OWE0ZTcwZjk2YTI2YTkzNjhhM2NhZWQyZjU1MmFhNjcxMDU4NTI6CgogIGRybS9pOTE1OiBG
aXggSUNMIG91dHB1dCBDU0MgcHJvZ3JhbW1pbmcgKDIwMTktMDQtMjkgMDk6NDk6MjEgKzAzMDAp
CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCi0gRml4IHRvIEljZWxha2UgQ1NDIGxvc2luZyBibHVlIGNoYW5uZWwKCi0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KVmlsbGUgU3lyasOkbMOkICgxKToKICAgICAgZHJtL2k5MTU6IEZpeCBJQ0wgb3V0cHV0IENT
QyBwcm9ncmFtbWluZwoKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2NvbG9yLmMgfCA2ICsr
Ky0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
