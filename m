Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3D9862B4
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 15:14:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D7C76E82C;
	Thu,  8 Aug 2019 13:14:08 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 552CE6E82C
 for <dri-devel@freedesktop.org>; Thu,  8 Aug 2019 13:14:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Aug 2019 06:14:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,361,1559545200"; d="scan'208";a="258704529"
Received: from namburis-mobl.ger.corp.intel.com (HELO
 delly.ger.corp.intel.com) ([10.249.34.123])
 by orsmga001.jf.intel.com with ESMTP; 08 Aug 2019 06:14:05 -0700
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
To: dri-devel@freedesktop.org
Subject: [PATCH v3 0/1] drm/syncobj: add syncobj sideband payload for threaded
 submission
Date: Thu,  8 Aug 2019 16:14:01 +0300
Message-Id: <20190808131402.14519-1-lionel.g.landwerlin@intel.com>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
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

SGksCgpIb3BlZnVsbHkgYWxsIGdvb2QgdGhpcyB0aW1lLgoKQ2hlZXJzLAoKTGlvbmVsIExhbmR3
ZXJsaW4gKDEpOgogIGRybS9zeW5jb2JqOiBhZGQgc2lkZWJhbmQgcGF5bG9hZAoKIGRyaXZlcnMv
Z3B1L2RybS9kcm1faW50ZXJuYWwuaCB8ICA0ICsrCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2lvY3Rs
LmMgICAgfCAgNSArKysKIGRyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jICB8IDc5ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KIGluY2x1ZGUvZHJtL2RybV9zeW5jb2JqLmgg
ICAgICB8ICA5ICsrKysKIGluY2x1ZGUvdWFwaS9kcm0vZHJtLmggICAgICAgICB8ICAyICsKIDUg
ZmlsZXMgY2hhbmdlZCwgOTggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKLS0KMi4yMy4w
LnJjMQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
