Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6F6AFF85
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 17:06:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A6676EB17;
	Wed, 11 Sep 2019 15:06:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9341C6EB17;
 Wed, 11 Sep 2019 15:06:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Sep 2019 08:06:00 -0700
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; d="scan'208";a="175671074"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Sep 2019 08:05:56 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Wed, 11 Sep 2019 18:05:53 +0300
Message-ID: <877e6e27qm.fsf@intel.com>
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
Cc: , dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhpIERhdmUgJiBEYW5pZWwgLQoKQSBjb3VwbGUgbW9yZSBmaXhlcyBmb3IgdjUuMywgYm90aCBj
Yzogc3RhYmxlLgoKCmRybS1pbnRlbC1maXhlcy0yMDE5LTA5LTExOgpGaW5hbCBkcm0vaTkxNSBm
aXhlcyBmb3IgdjUuMzoKLSBGb3ggRFAgTVNUIGhpZ2ggY29sb3IgZGVwdGggcmVncmVzc2lvbgot
IEZpeCBHUFUgaGFuZ3Mgb24gVnVsa2FuIGNvbXB1dGUgd29ya2xvYWRzCgpCUiwKSmFuaS4KClRo
ZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgZjc0YzJiYjk4Nzc2ZTJkZTUwOGY0ZDYw
N2NkNTE5ODczMDY1MTE4ZToKCiAgTGludXggNS4zLXJjOCAoMjAxOS0wOS0wOCAxMzozMzoxNSAt
MDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6Ly9h
bm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtLWludGVsIHRhZ3MvZHJtLWludGVsLWZpeGVz
LTIwMTktMDktMTEKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byAyZWIwOTY0ZWVjNWYx
ZDk5ZjllYWY0OTYzZWVlMjY3YWNjNzJiNjE1OgoKICBkcm0vaTkxNTogUmVzdG9yZSByZWxheGVk
IHBhZGRpbmcgKE9DTF9PT0JfU1VQUFJFU19FTkFCTEUpIGZvciBza2wrICgyMDE5LTA5LTA5IDE2
OjEwOjI4ICswMzAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpGaW5hbCBkcm0vaTkxNSBmaXhlcyBmb3IgdjUuMzoKLSBG
b3ggRFAgTVNUIGhpZ2ggY29sb3IgZGVwdGggcmVncmVzc2lvbgotIEZpeCBHUFUgaGFuZ3Mgb24g
VnVsa2FuIGNvbXB1dGUgd29ya2xvYWRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkNocmlzIFdpbHNvbiAoMSk6CiAgICAg
IGRybS9pOTE1OiBSZXN0b3JlIHJlbGF4ZWQgcGFkZGluZyAoT0NMX09PQl9TVVBQUkVTX0VOQUJM
RSkgZm9yIHNrbCsKClZpbGxlIFN5cmrDpGzDpCAoMSk6CiAgICAgIGRybS9pOTE1OiBMaW1pdCBN
U1QgdG8gPD0gOGJwYyBvbmNlIGFnYWluCgogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9kcF9tc3QuYyB8IDEwICsrKysrKysrKy0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2lu
dGVsX3dvcmthcm91bmRzLmMgfCAgNSAtLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlv
bnMoKyksIDYgZGVsZXRpb25zKC0pCgotLSAKSmFuaSBOaWt1bGEsIEludGVsIE9wZW4gU291cmNl
IEdyYXBoaWNzIENlbnRlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
