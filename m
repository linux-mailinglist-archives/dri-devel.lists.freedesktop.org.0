Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA7E2FF0DF
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 17:49:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BFE86E0B6;
	Thu, 21 Jan 2021 16:49:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E88296E0B6;
 Thu, 21 Jan 2021 16:49:19 +0000 (UTC)
IronPort-SDR: 74P1drKxoUEYxN9gz/tTUCLO8Dav8rTvU9R/CfvHTZyUTPsCt5KRiqm2UeXgHARMQiWwb7jwge
 9JlcX2EuP7/w==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="240838944"
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; d="scan'208";a="240838944"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2021 08:49:15 -0800
IronPort-SDR: GVchUQIvY9blDHEasiffspbbfuYEgExLBcf1VOLyCHrI/IGL5C2tujlix+gBYxHjd1Ekob13hx
 K6t/P38E1obg==
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; d="scan'208";a="385374503"
Received: from cohrs-mobl.ger.corp.intel.com (HELO localhost) ([10.252.51.23])
 by orsmga008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 08:49:11 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 21 Jan 2021 18:49:08 +0200
Message-ID: <87a6t2kzgb.fsf@intel.com>
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
Cc: , dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhpIERhdmUgJiBEYW5pZWwgLQoKZHJtLWludGVsLWZpeGVzLTIwMjEtMDEtMjE6CmRybS9pOTE1
IGZpeGVzIGZvciB2NS4xMS1yYzU6Ci0gSERDUCBmaXhlcwotIFBNVSB3YWtlcmVmIGZpeAotIEZp
eCBIV1NQIHZhbGlkaXR5IHJhY2UKLSBGaXggRFAgcHJvdG9jb2wgY29udmVydGVyIGFjY2lkZW50
YWwgNDo0OjQtPjQ6MjowIGNvbnZlcnNpb24gZm9yIFJHQgoKQlIsCkphbmkuCgpUaGUgZm9sbG93
aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDE5YzMyOWY2ODA4OTk1YjE0MmIzOTY2MzAxZjIxN2M4
MzFlN2NmMzE6CgogIExpbnV4IDUuMTEtcmM0ICgyMDIxLTAxLTE3IDE2OjM3OjA1IC0wODAwKQoK
YXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogIGdpdDovL2Fub25naXQu
ZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0taW50ZWwgdGFncy9kcm0taW50ZWwtZml4ZXMtMjAyMS0w
MS0yMQoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDFjNDk5NWIwYTU3NmQyNGJiN2Vh
ZDk5MWZiMDM3YzhiNDdhYjZlMzI6CgogIGRybS9pOTE1OiBPbmx5IGVuYWJsZSBERlAgNDo0OjQt
PjQ6MjowIGNvbnZlcnNpb24gd2hlbiBvdXRwdXR0aW5nIFlDYkNyIDQ6NDo0ICgyMDIxLTAxLTE5
IDEwOjQ0OjA2ICswMjAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpkcm0vaTkxNSBmaXhlcyBmb3IgdjUuMTEtcmM1Ogot
IEhEQ1AgZml4ZXMKLSBQTVUgd2FrZXJlZiBmaXgKLSBGaXggSFdTUCB2YWxpZGl0eSByYWNlCi0g
Rml4IERQIHByb3RvY29sIGNvbnZlcnRlciBhY2NpZGVudGFsIDQ6NDo0LT40OjI6MCBjb252ZXJz
aW9uIGZvciBSR0IKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KQW5zaHVtYW4gR3VwdGEgKDIpOgogICAgICBkcm0vaTkxNS9o
ZGNwOiBVcGRhdGUgQ1AgcHJvcGVydHkgaW4gdXBkYXRlX3BpcGUKICAgICAgZHJtL2k5MTUvaGRj
cDogR2V0IGNvbm4gd2hpbGUgY29udGVudF90eXBlIGNoYW5nZWQKCkNocmlzIFdpbHNvbiAoMik6
CiAgICAgIGRybS9pOTE1L2d0OiBQcmV2ZW50IHVzZSBvZiBlbmdpbmUtPndhX2N0eCBhZnRlciBl
cnJvcgogICAgICBkcm0vaTkxNTogQ2hlY2sgZm9yIHJxLT5od3NwIHZhbGlkaXR5IGFmdGVyIGFj
cXVpcmluZyBSQ1UgbG9jawoKVHZydGtvIFVyc3VsaW4gKDEpOgogICAgICBkcm0vaTkxNS9wbXU6
IERvbid0IGdyYWIgd2FrZXJlZiB3aGVuIGVuYWJsaW5nIGV2ZW50cwoKVmlsbGUgU3lyasOkbMOk
ICgxKToKICAgICAgZHJtL2k5MTU6IE9ubHkgZW5hYmxlIERGUCA0OjQ6NC0+NDoyOjAgY29udmVy
c2lvbiB3aGVuIG91dHB1dHRpbmcgWUNiQ3IgNDo0OjQKCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2RkaS5jICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfZHAuYyAgICAgfCAgOSArKystLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2RwLmggICAgIHwgIDMgKystCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2hkY3AuYyAgIHwgIDkgKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50
ZWxfYnJlYWRjcnVtYnMuYyB8ICA5ICsrLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2lu
dGVsX2xyYy5jICAgICAgICAgfCAgMyArKysKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVs
X3RpbWVsaW5lLmMgICAgfCAxMCArKysrLS0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9w
bXUuYyAgICAgICAgICAgICB8IDMwICsrKysrKysrKysrKy0tLS0tLS0tLS0tCiBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9pOTE1X3JlcXVlc3QuaCAgICAgICAgIHwgMzcgKysrKysrKysrKysrKysrKysr
KysrKysrKy0tLS0KIDkgZmlsZXMgY2hhbmdlZCwgNzQgaW5zZXJ0aW9ucygrKSwgMzggZGVsZXRp
b25zKC0pCgotLSAKSmFuaSBOaWt1bGEsIEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRl
cgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
