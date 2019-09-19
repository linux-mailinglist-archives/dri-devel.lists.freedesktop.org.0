Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BFAB7BF0
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 16:16:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77FDC6F49B;
	Thu, 19 Sep 2019 14:16:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B57C76F499;
 Thu, 19 Sep 2019 14:16:08 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Sep 2019 07:16:08 -0700
X-IronPort-AV: E=Sophos;i="5.64,523,1559545200"; d="scan'208";a="181483296"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com) ([10.7.196.65])
 by orsmga008-auth.jf.intel.com with
 ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Sep 2019 07:16:07 -0700
Date: Thu, 19 Sep 2019 07:16:38 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 rodrigo.vivi@intel.com
Subject: [PULL] drm-intel-next-fixes
Message-ID: <20190919141638.GA23871@intel.com>
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSBhbmQgRGFuaWVsLAoKSGVyZSBnb2VzIGRybS1pbnRlbC1uZXh0LWZpeGVzLTIwMTkt
MDktMTk6Ci0gRXh0ZW5kIG9sZCBIU1cgd29ya2Fyb3VuZCB0byBmaXggc29tZSBHUFUgaGFuZ3Mg
b24gSGFzd2VsbCBHVDIKLSBGaXggcmV0dXJuIGVycm9yIGNvZGUgb24gR0VNIG1tYXAuCi0gV2hp
dGUgbGlzdCBhIGNoaWNrZW4gYml0IHJlZ2lzdGVyIGZvciBwdXNoIGNvbnN0YW50cyBsZWdhY3kg
bW9kZSBvbiBNZXNhCi0gRml4IHJlc3VtZSBpc3N1ZSByZWxhdGVkIHRvIEdHVFQgcmVzdG9yZQot
IFJlbW92ZSBpbmNvcnJlY3QgQlVHX09OIG9uIGV4ZWNsaXN0J3Mgc2NoZWR1bGUtb3V0Ci0gRml4
IHVucmVjb3ZlcmFibGUgR1BVIGhhbmdzIHdpdGggVnVsa2FuIGNvbXB1dGUgd29ya2xvYWRzIG9u
IFNLTAoKVGhhbmtzLApSb2RyaWdvLgoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1p
dCA2ZTVjNTI3MmNhMDA4MDlhYWUyMDgxN2VmYjZmMjU4ODEyNjhiNTBiOgoKICBkcm0vaTkxNTog
VXNlIE5PRVZJQ1QgZm9yIGZpcnN0IHBhc3Mgb24gYXR0ZW1waW5nIHRvIHBpbiBhIEdHVFQgbW1h
cCAoMjAxOS0wOS0wNiAwOTo1MzoxNSAtMDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCBy
ZXBvc2l0b3J5IGF0OgoKICBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtLWlu
dGVsIHRhZ3MvZHJtLWludGVsLW5leHQtZml4ZXMtMjAxOS0wOS0xOQoKZm9yIHlvdSB0byBmZXRj
aCBjaGFuZ2VzIHVwIHRvIGE5NTgxOWExNzM3ODhiZWM3NDE0ZDI2MGY3NmY0MmE5OTM0ODkwYjQ6
CgogIGRybS9pOTE1OiBFeHRlbmQgSGFzd2VsbCBHVDEgUFNNSSB3b3JrYXJvdW5kIHRvIGFsbCAo
MjAxOS0wOS0xOCAxMDo1MzozOCAtMDcwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KLSBFeHRlbmQgb2xkIEhTVyB3b3Jr
YXJvdW5kIHRvIGZpeCBzb21lIEdQVSBoYW5ncyBvbiBIYXN3ZWxsIEdUMgotIEZpeCByZXR1cm4g
ZXJyb3IgY29kZSBvbiBHRU0gbW1hcC4KLSBXaGl0ZSBsaXN0IGEgY2hpY2tlbiBiaXQgcmVnaXN0
ZXIgZm9yIHB1c2ggY29uc3RhbnRzIGxlZ2FjeSBtb2RlIG9uIE1lc2EKLSBGaXggcmVzdW1lIGlz
c3VlIHJlbGF0ZWQgdG8gR0dUVCByZXN0b3JlCi0gUmVtb3ZlIGluY29ycmVjdCBCVUdfT04gb24g
ZXhlY2xpc3QncyBzY2hlZHVsZS1vdXQKLSBGaXggdW5yZWNvdmVyYWJsZSBHUFUgaGFuZ3Mgd2l0
aCBWdWxrYW4gY29tcHV0ZSB3b3JrbG9hZHMgb24gU0tMCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkNocmlzIFdpbHNvbiAo
NSk6CiAgICAgIGRybS9pOTE1OiBSZXN0b3JlIHJlbGF4ZWQgcGFkZGluZyAoT0NMX09PQl9TVVBQ
UkVTX0VOQUJMRSkgZm9yIHNrbCsKICAgICAgZHJtL2k5MTUvZXhlY2xpc3RzOiBSZW1vdmUgaW5j
b3JyZWN0IEJVR19PTiBmb3Igc2NoZWR1bGUtb3V0CiAgICAgIGRybS9pOTE1OiBQZXJmb3JtIEdH
VFQgcmVzdG9yZSBtdWNoIGVhcmxpZXIgZHVyaW5nIHJlc3VtZQogICAgICBkcm0vaTkxNTogRG9u
J3QgbWl4IHNyY3UgdGFnIGFuZCBuZWdhdGl2ZSBlcnJvciBjb2RlcwogICAgICBkcm0vaTkxNTog
RXh0ZW5kIEhhc3dlbGwgR1QxIFBTTUkgd29ya2Fyb3VuZCB0byBhbGwKCktlbm5ldGggR3JhdW5r
ZSAoMSk6CiAgICAgIGRybS9pOTE1OiBXaGl0ZWxpc3QgQ09NTU9OX1NMSUNFX0NISUNLRU4yCgog
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX21tYW4uYyAgICB8IDYgKystLS0tCiBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fcG0uYyAgICAgIHwgMyAtLS0KIGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2xyYy5jICAgICAgICAgfCAxIC0KIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2d0L2ludGVsX3Jlc2V0LmMgICAgICAgfCA4ICsrKy0tLS0tCiBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndC9pbnRlbF9yZXNldC5oICAgICAgIHwgMiArLQogZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3QvaW50ZWxfcmluZ2J1ZmZlci5jICB8IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2d0L2ludGVsX3dvcmthcm91bmRzLmMgfCA4ICsrKy0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9pOTE1X2Rydi5jICAgICAgICAgICAgIHwgNSArKysrKwogZHJpdmVycy9ncHUvZHJtL2k5MTUv
c2VsZnRlc3RzL2k5MTVfZ2VtLmMgICB8IDYgKysrKysrCiA5IGZpbGVzIGNoYW5nZWQsIDIxIGlu
c2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
