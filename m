Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B236A555E
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 13:56:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9533899F2;
	Mon,  2 Sep 2019 11:56:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4E77890D2
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 11:56:48 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Sep 2019 04:56:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,459,1559545200"; d="scan'208";a="184479763"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 02 Sep 2019 04:56:46 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1i4kww-0002nP-2R; Mon, 02 Sep 2019 19:56:46 +0800
Date: Mon, 2 Sep 2019 19:55:59 +0800
From: kbuild test robot <lkp@intel.com>
To: Oded Gabbay <oded.gabbay@gmail.com>
Subject: [gabbayo:habanalabs-next 25/29]
 drivers/misc/habanalabs/device.c:552:2-3: Unneeded semicolon
Message-ID: <201909021944.2gR6o8Zw%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: Omer Shpigelman <oshpigelman@habana.ai>, kbuild-all@01.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dHJlZTogICBnaXQ6Ly9wZW9wbGUuZnJlZWRlc2t0b3Aub3JnL35nYWJiYXlvL2xpbnV4IGhhYmFu
YWxhYnMtbmV4dApoZWFkOiAgIGYzZDQwZmZlYjg5NTY0ZDMxMjk1ZmIwMWJjMDQ5Mjk2NjFlMmJi
Y2YKY29tbWl0OiAxMjdkMjBjMWRhNjEwNDVhNzkwM2M1ZDc2YWZlMTRiM2EzYTA5N2MyIFsyNS8y
OV0gaGFiYW5hbGFiczogYWRkIHVhcGkgdG8gcmV0cmlldmUgZGV2aWNlIHV0aWxpemF0aW9uCgpJ
ZiB5b3UgZml4IHRoZSBpc3N1ZSwga2luZGx5IGFkZCBmb2xsb3dpbmcgdGFnClJlcG9ydGVkLWJ5
OiBrYnVpbGQgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KCgpjb2NjaW5lbGxlIHdhcm5pbmdz
OiAobmV3IG9uZXMgcHJlZml4ZWQgYnkgPj4pCgo+PiBkcml2ZXJzL21pc2MvaGFiYW5hbGFicy9k
ZXZpY2UuYzo1NTI6Mi0zOiBVbm5lZWRlZCBzZW1pY29sb24KClBsZWFzZSByZXZpZXcgYW5kIHBv
c3NpYmx5IGZvbGQgdGhlIGZvbGxvd3VwIHBhdGNoLgoKLS0tCjAtREFZIGtlcm5lbCB0ZXN0IGlu
ZnJhc3RydWN0dXJlICAgICAgICAgICAgICAgIE9wZW4gU291cmNlIFRlY2hub2xvZ3kgQ2VudGVy
Cmh0dHBzOi8vbGlzdHMuMDEub3JnL3BpcGVybWFpbC9rYnVpbGQtYWxsICAgICAgICAgICAgICAg
ICAgIEludGVsIENvcnBvcmF0aW9uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
