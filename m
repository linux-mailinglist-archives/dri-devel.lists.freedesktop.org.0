Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECF3F779A
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 16:26:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE616E92A;
	Mon, 11 Nov 2019 15:26:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 368CC6E92A;
 Mon, 11 Nov 2019 15:26:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Nov 2019 07:26:06 -0800
X-IronPort-AV: E=Sophos;i="5.68,293,1569308400"; d="scan'208";a="197698337"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Nov 2019 07:26:01 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
Subject: [PULL] topic/drm-mipi-dsi-dsc-updates
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Mon, 11 Nov 2019 17:25:40 +0200
Message-ID: <87tv7a4eq3.fsf@intel.com>
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
Cc: dim-tools@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Vinay Simha BN <simhavcs@gmail.com>,
 Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhpIFNlYW4sIE1hYXJ0ZW4gYW5kIE1heGltZSAtCgpIZXJlJ3MgdGhlIHRvcGljIGJyYW5jaCBh
Ym91dCBEU0kgY2hhbmdlcyBhcyBJIHdyb3RlIGluIFsxXS4gT25jZSB5b3UndmUKcHVsbGVkIHRo
aXMgaW4gZHJtLW1pc2MsIEknbGwgZm9sbG93IHN1aXQgaW4gaTkxNS4KCgpUaGFua3MsCkphbmku
CgpbMV0gaHR0cDovL21hcmMuaW5mby8/aT04N3NnbXo2Y3cwLmZzZkBpbnRlbC5jb20KCgoKdG9w
aWMvZHJtLW1pcGktZHNpLWRzYy11cGRhdGVzLTIwMTktMTEtMTE6CkNvcmUgQ2hhbmdlczoKLSBV
cGRhdGUgRFNJIGRhdGEgdHlwZSBhbmQgY29tbWFuZCBkZWZpbml0aW9ucwotIEFkZCBoZWxwZXJz
IGZvciBzZW5kaW5nIGNvbXByZXNzaW9uIG1vZGUgYW5kIFBQUyBwYWNrZXRzCgpEcml2ZXIgQ2hh
bmdlczoKLSBVcGRhdGUgdGlueS9zdDc1ODYgdG8gcmVmbGVjdCBhIGRlZmluaXRpb24gY2hhbmdl
CgoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA1NGVjYjhmNzAyOGM1ZWIzZDc0
MGJiODJiMGYxZDkwZjJkZjYzYzVjOgoKICBMaW51eCA1LjQtcmMxICgyMDE5LTA5LTMwIDEwOjM1
OjQwIC0wNzAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogIGdp
dDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0taW50ZWwgdGFncy90b3BpYy9kcm0t
bWlwaS1kc2ktZHNjLXVwZGF0ZXMtMjAxOS0xMS0xMQoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2Vz
IHVwIHRvIGY0ZGVhMWFhYTlhMTI0ODZmNTgxM2ZhZGE1NzQxOTJmZWIzODUwY2Q6CgogIGRybS9k
c2k6IGFkZCBoZWxwZXJzIGZvciBEU0kgY29tcHJlc3Npb24gbW9kZSBhbmQgUFBTIHBhY2tldHMg
KDIwMTktMTEtMDcgMTU6MDA6MTYgKzAyMDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkNvcmUgQ2hhbmdlczoKLSBVcGRh
dGUgRFNJIGRhdGEgdHlwZSBhbmQgY29tbWFuZCBkZWZpbml0aW9ucwotIEFkZCBoZWxwZXJzIGZv
ciBzZW5kaW5nIGNvbXByZXNzaW9uIG1vZGUgYW5kIFBQUyBwYWNrZXRzCgpEcml2ZXIgQ2hhbmdl
czoKLSBVcGRhdGUgdGlueS9zdDc1ODYgdG8gcmVmbGVjdCBhIGRlZmluaXRpb24gY2hhbmdlCgot
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCkphbmkgTmlrdWxhICg1KToKICAgICAgZHJtL2RzaTogY2xlYW4gdXAgRFNJIGRhdGEg
dHlwZSBkZWZpbml0aW9ucwogICAgICBkcm0vZHNpOiBhZGQgbWlzc2luZyBEU0kgZGF0YSB0eXBl
cwogICAgICBkcm0vZHNpOiBhZGQgbWlzc2luZyBEU0kgRENTIGNvbW1hbmRzCiAgICAgIGRybS9k
c2k6IHJlbmFtZSBNSVBJX0RDU19TRVRfUEFSVElBTF9BUkVBIHRvIE1JUElfRENTX1NFVF9QQVJU
SUFMX1JPV1MKICAgICAgZHJtL2RzaTogYWRkIGhlbHBlcnMgZm9yIERTSSBjb21wcmVzc2lvbiBt
b2RlIGFuZCBQUFMgcGFja2V0cwoKIGRyaXZlcnMvZ3B1L2RybS9kcm1fbWlwaV9kc2kuYyB8IDU3
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLQogZHJpdmVycy9ncHUv
ZHJtL3Rpbnkvc3Q3NTg2LmMgIHwgIDIgKy0KIGluY2x1ZGUvZHJtL2RybV9taXBpX2RzaS5oICAg
ICB8ICA0ICsrKwogaW5jbHVkZS92aWRlby9taXBpX2Rpc3BsYXkuaCAgIHwgMjQgKysrKysrKysr
KysrKy0tLS0tCiA0IGZpbGVzIGNoYW5nZWQsIDc4IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25z
KC0pCgotLSAKSmFuaSBOaWt1bGEsIEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
