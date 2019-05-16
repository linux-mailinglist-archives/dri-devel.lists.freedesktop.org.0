Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0BB20D86
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 18:58:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D86778973E;
	Thu, 16 May 2019 16:58:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 840C88973E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 16:58:08 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 May 2019 09:58:06 -0700
X-ExtLoop1: 1
Received: from mkidd-mobl1.ger.corp.intel.com (HELO intel.com) ([10.252.20.94])
 by orsmga006.jf.intel.com with ESMTP; 16 May 2019 09:58:05 -0700
Date: Thu, 16 May 2019 17:58:05 +0100
From: Eric Engestrom <eric.engestrom@intel.com>
To: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH] drm: Fix drm.h uapi header for GNU/kFreeBSD
Message-ID: <20190516165805.5ofs5udykkocysln@intel.com>
References: <20190115150418.68080-1-jrtc27@jrtc27.com>
 <87tve334o1.fsf@anholt.net> <87d0kibbjf.fsf@anholt.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87d0kibbjf.fsf@anholt.net>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. 1134945 - Pipers Way,
 Swindon SN3 1RJ
User-Agent: NeoMutt/20180716
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
Cc: James Clarke <jrtc27@jrtc27.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1cnNkYXksIDIwMTktMDUtMTYgMDk6Mzc6NDAgLTA3MDAsIEVyaWMgQW5ob2x0IHdyb3Rl
Ogo+IEVyaWMgQW5ob2x0IDxlcmljQGFuaG9sdC5uZXQ+IHdyaXRlczoKPiAKPiA+IFsgVW5rbm93
biBzaWduYXR1cmUgc3RhdHVzIF0KPiA+IEphbWVzIENsYXJrZSA8anJ0YzI3QGpydGMyNy5jb20+
IHdyaXRlczoKPiA+Cj4gPj4gTGlrZSBHTlUvTGludXgsIEdOVS9rRnJlZUJTRCdzIHN5cy90eXBl
cy5oIGRvZXMgbm90IGRlZmluZSB0aGUgdWludFhfdAo+ID4+IHR5cGVzLCB3aGljaCBkaWZmZXJz
IGZyb20gdGhlIEJTRHMnIGhlYWRlcnMuIFRodXMgd2Ugc2hvdWxkIGluY2x1ZGUKPiA+PiBzdGRp
bnQuaCB0byBlbnN1cmUgd2UgaGF2ZSBhbGwgdGhlIHJlcXVpcmVkIGludGVnZXIgdHlwZXMuCj4g
Pj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBDbGFya2UgPGpydGMyN0BqcnRjMjcuY29tPgo+
ID4KPiA+IFJldmlld2VkLWJ5OiBFcmljIEFuaG9sdCA8ZXJpY0BhbmhvbHQubmV0Pgo+IAo+IEFu
ZCBwdXNoZWQgdG8gZHJtLW1pc2MtbmV4dCBub3cuCgpUaGFua3MgRXJpYyEKCkphbWVzLCB0aGF0
IG1lYW5zIHlvdSBjYW4gbm93IHN5bmMgbGliZHJtIHRvIGdldCB0aGUgZml4IHRoZXJlIGFzIHdl
bGwgOikKClNlZSBpbmNsdWRlL2RybS9SRUFETUUgZm9yIGRldGFpbHMKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
