Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC4A307737
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 14:37:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA5646E963;
	Thu, 28 Jan 2021 13:37:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 111C26E95C;
 Thu, 28 Jan 2021 13:37:42 +0000 (UTC)
IronPort-SDR: ItQRNOY16ZnMb2V8L4EKo/jtj6dH1xiy5oxayA6B3ax7KqUFOo/SIxi6+R4MNbnfy2t7ZBziac
 DZlTq4N8ZwGA==
X-IronPort-AV: E=McAfee;i="6000,8403,9877"; a="180309862"
X-IronPort-AV: E=Sophos;i="5.79,382,1602572400"; d="scan'208";a="180309862"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2021 05:37:41 -0800
IronPort-SDR: HuyPoWfffWx4GgnaRwvfTLtEYu8Jxsmo/EL/wEFuhNZzIy+CWdp3FO9LucpiTu9LgUrJvDk+BB
 2AtnpvU8Aq0A==
X-IronPort-AV: E=Sophos;i="5.79,382,1602572400"; d="scan'208";a="388817489"
Received: from tdietric-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.32.183])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2021 05:37:37 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 28 Jan 2021 15:37:34 +0200
Message-ID: <87y2gdi3mp.fsf@intel.com>
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

CkhpIERhdmUgJiBEYW5pZWwgLQoKQXBwYXJlbnRseSB0aGVyZSdzIGEgcmVncmVzc2lvbiBpbiAt
cmM1IHRoYXQgYWZmZWN0cyBhIGxhcmdlIHBvcnRpb24gb2YKdGhlIHBsYXRmb3JtcyBpbiBDSS4g
U2VlIFsxXS4KClRoZSBpc3N1ZSBzaG93ZWQgdXAgaW4gLXJjNSBpLmUuICpiZWZvcmUqIHRoZSBj
aGFuZ2VzIGluIHRoaXMgcHVsbCwKaG93ZXZlciB0aGUgaXNzdWUgcHJldmVudHMgZ2V0dGluZyBm
dWxsIGNvdmVyYWdlIFsyXS4gSXQgZG9lcyBub3QgbG9vawpsaWtlIHRoaXMgcHVsbCBtYWtlcyBt
YXR0ZXJzIHdvcnNlLCBidXQgdGhpcyBkb2VzIG5vdCBtYWtlIHRoZW0gYmV0dGVyCmVpdGhlci4K
CgpCUiwKSmFuaS4KCgpbMV0gaHR0cDovL2xvcmUua2VybmVsLm9yZy9yLzg3MXJlNWppdTMuZnNm
QGludGVsLmNvbQpbMl0gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLWludGVs
LWZpeGVzL2luZGV4Lmh0bWw/Cgpkcm0taW50ZWwtZml4ZXMtMjAyMS0wMS0yODoKZHJtL2k5MTUg
Zml4ZXMgZm9yIHY1LjExLXJjNjoKLSBGaXggSUNMIE1HIFBIWSB2c3dpbmcKLSBGaXggc3VicGxh
dGZvcm0gaGFuZGxpbmcKLSBGaXggc2VsZnRlc3QgbWVtbGVhawotIENsZWFyIENBQ0hFX01PREUg
cHJpb3IgdG8gY2xlYXJpbmcgcmVzaWR1YWxzCi0gQWx3YXlzIGZsdXNoIHRoZSBhY3RpdmUgd29y
a2VyIGJlZm9yZSByZXR1cm5pbmcgZnJvbSB0aGUgd2FpdAotIEFsd2F5cyB0cnkgdG8gcmVzZXJ2
ZSBHR1RUIGFkZHJlc3MgMHgwCgoKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQg
NmVlMWQ3NDViN2M5ZmQ1NzNmYmExNDJhMmVmZGFkNzZhOWYxY2IwNDoKCiAgTGludXggNS4xMS1y
YzUgKDIwMjEtMDEtMjQgMTY6NDc6MTQgLTA4MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQg
cmVwb3NpdG9yeSBhdDoKCiAgZ2l0Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS1p
bnRlbCB0YWdzL2RybS1pbnRlbC1maXhlcy0yMDIxLTAxLTI4Cgpmb3IgeW91IHRvIGZldGNoIGNo
YW5nZXMgdXAgdG8gNDg5MTQwYjViYTJlN2NjNGI4NTNjMjllMDU5MTg5NWRkYjQ2MmE4MjoKCiAg
ZHJtL2k5MTUvZ3Q6IEFsd2F5cyB0cnkgdG8gcmVzZXJ2ZSBHR1RUIGFkZHJlc3MgMHgwICgyMDIx
LTAxLTI2IDE1OjQ1OjU0ICswMjAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpkcm0vaTkxNSBmaXhlcyBmb3IgdjUuMTEt
cmM2OgotIEZpeCBJQ0wgTUcgUEhZIHZzd2luZwotIEZpeCBzdWJwbGF0Zm9ybSBoYW5kbGluZwot
IEZpeCBzZWxmdGVzdCBtZW1sZWFrCi0gQ2xlYXIgQ0FDSEVfTU9ERSBwcmlvciB0byBjbGVhcmlu
ZyByZXNpZHVhbHMKLSBBbHdheXMgZmx1c2ggdGhlIGFjdGl2ZSB3b3JrZXIgYmVmb3JlIHJldHVy
bmluZyBmcm9tIHRoZSB3YWl0Ci0gQWx3YXlzIHRyeSB0byByZXNlcnZlIEdHVFQgYWRkcmVzcyAw
eDAKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KQ2hyaXMgV2lsc29uICgzKToKICAgICAgZHJtL2k5MTUvZ3Q6IENsZWFyIENB
Q0hFX01PREUgcHJpb3IgdG8gY2xlYXJpbmcgcmVzaWR1YWxzCiAgICAgIGRybS9pOTE1OiBBbHdh
eXMgZmx1c2ggdGhlIGFjdGl2ZSB3b3JrZXIgYmVmb3JlIHJldHVybmluZyBmcm9tIHRoZSB3YWl0
CiAgICAgIGRybS9pOTE1L2d0OiBBbHdheXMgdHJ5IHRvIHJlc2VydmUgR0dUVCBhZGRyZXNzIDB4
MAoKUGFuIEJpYW4gKDEpOgogICAgICBkcm0vaTkxNS9zZWxmdGVzdDogRml4IHBvdGVudGlhbCBt
ZW1vcnkgbGVhawoKVW1lc2ggTmVybGlnZSBSYW1hcHBhICgxKToKICAgICAgZHJtL2k5MTU6IENo
ZWNrIGZvciBhbGwgc3VicGxhdGZvcm0gYml0cwoKVmlsbGUgU3lyasOkbMOkICgxKToKICAgICAg
ZHJtL2k5MTU6IEZpeCBJQ0wgTUcgUEhZIHZzd2luZyBoYW5kbGluZwoKIGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGRpLmMgICAgICB8ICA3ICsrLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d0L2dlbjdfcmVuZGVyY2xlYXIuYyAgICB8IDEyICsrKysrKysKIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2d0L2ludGVsX2dndHQuYyAgICAgICAgICB8IDQ3ICsrKysrKysrKysrKysrKysr
KysrLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9hY3RpdmUuYyAgICAgICAgICAg
IHwgMjggKysrKysrKystLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYuaCAg
ICAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L3NlbGZ0ZXN0cy9pOTE1
X2dlbV9ndHQuYyB8ICAyICstCiA2IGZpbGVzIGNoYW5nZWQsIDY3IGluc2VydGlvbnMoKyksIDMx
IGRlbGV0aW9ucygtKQoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGlj
cyBDZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
