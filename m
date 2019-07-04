Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 616685F2E7
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 08:32:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF056E265;
	Thu,  4 Jul 2019 06:32:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 585866E265
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 06:32:24 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id a10so4165277wrp.9
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2019 23:32:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=iH0UtePV4Ue87ba8NVmnhuYwy2TuGhwvWFhgYfTG2sY=;
 b=VlqUVDnCia4+MVneTlQ4yTbq+ZPaFsMdyMr5O2z7hNiYTmcqFdozNdlY436VpqgWVM
 hl2jyAAS86pfQi7e5DIV0ZDc0sQtGD3UmFUCGZUmQL6kWuEkIKX6bvFNrrG0IV1mvVQ6
 Bcnnwwg+Xaw6e5Fg0vAXTWBMNZi/rH/KO5f5PM9FZ9UvAT53sG433AClOlBe00L1+pcP
 Arc4z6fWsoWAiAC7cuXuAhts5j4z8kv87ftN9wDATrT9LosTFdrPUCTtPokWNCdFudTP
 gYWnntFrxUE8ucr8+t4HLGBhsmlKx+E2JbZSxxq1hy6wfZkdD5J3JUcAqc9jc1qJIrRm
 IHJw==
X-Gm-Message-State: APjAAAW+hI7AHws+3Xw4qcnaTFIfDe1Hmls3Y7bqkH5GqY0GoOV5PumX
 tkfQq985o4r4sztQQsQrVTE=
X-Google-Smtp-Source: APXvYqyaZraKaWcz8qSssEGuN6b/SN2SBebIzrJTO5N2XWwPaKj1Ak6RH+FXNdyYDKwPHqmIb7Ji5A==
X-Received: by 2002:adf:fc4f:: with SMTP id e15mr30715027wrs.2.1562221942998; 
 Wed, 03 Jul 2019 23:32:22 -0700 (PDT)
Received: from ogabbay-VM.habana-labs.com ([31.154.190.6])
 by smtp.gmail.com with ESMTPSA id t80sm4855341wmt.26.2019.07.03.23.32.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 23:32:22 -0700 (PDT)
From: Oded Gabbay <oded.gabbay@gmail.com>
To: alexdeucher@gmail.com, airlied@gmail.com, dri-devel@lists.freedesktop.org
Subject: [PATCH v2] MAINTAINERS: update amdkfd maintainer
Date: Thu,  4 Jul 2019 09:32:20 +0300
Message-Id: <20190704063220.2193-1-oded.gabbay@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=iH0UtePV4Ue87ba8NVmnhuYwy2TuGhwvWFhgYfTG2sY=;
 b=fH0mAQleb+Rd2PC0EPg9ZrDMRV07Q+2AsDhMngNktS+G0ICU35QX6/VWlnj2rqM7IO
 RRWazHW4t5jsHEqODPHeJuiYy+EQyIcEPm4fWSbjNvRncTEAepPRZNW361iu9jrWS1CS
 sTEkGB/00qn2XJa3n5eRnqyCDyg3e3H1dpLyWKuZ+X6n1I1y3VTs0rjICpK4Jhd9/9Kv
 VOltavhbqQw5SVSXF21BlToecjMxL9/9/fKjUd3E+0fr7uWoFU9cZoC3RQLmTVJnUXZU
 DW64GB8AHlCIMTMb+n4KcDT989pg2AaCoT/GJ9Z0wcPqKukBy0T55oWO19pinO+xsRMp
 uoeQ==
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
Cc: Felix.Kuehling@amd.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSdtIGxlYXZpbmcgdGhlIHJvbGUgb2YgYW1ka2ZkIG1haW50YWluZXIuIFRoZXJlZm9yZSwgdXBk
YXRlIHRoZSByZWxldmFudAplbnRyeSBpbiB0aGUgTUFJTlRBSU5FUlMgZmlsZSB3aXRoIHRoZSBu
YW1lIG9mIHRoZSBuZXcgbWFpbnRhaW5lci4KCkdvb2QgTHVjayEKClNpZ25lZC1vZmYtYnk6IE9k
ZWQgR2FiYmF5IDxvZGVkLmdhYmJheUBnbWFpbC5jb20+Ci0tLQogTUFJTlRBSU5FUlMgfCA0ICsr
LS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwppbmRleCAwMWE1MmZjOTY0ZGEuLjlh
NmMxNWZhNWZkNSAxMDA2NDQKLS0tIGEvTUFJTlRBSU5FUlMKKysrIGIvTUFJTlRBSU5FUlMKQEAg
LTgyMSw5ICs4MjEsOSBAQCBGOglkcml2ZXJzL2lvbW11L2FtZF9pb21tdSouW2NoXQogRjoJaW5j
bHVkZS9saW51eC9hbWQtaW9tbXUuaAogCiBBTUQgS0ZECi1NOglPZGVkIEdhYmJheSA8b2RlZC5n
YWJiYXlAZ21haWwuY29tPgorTToJRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5j
b20+CiBMOglkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCi1UOglnaXQgZ2l0Oi8vcGVv
cGxlLmZyZWVkZXNrdG9wLm9yZy9+Z2FiYmF5by9saW51eC5naXQKK1Q6CWdpdCBnaXQ6Ly9wZW9w
bGUuZnJlZWRlc2t0b3Aub3JnL35hZ2Q1Zi9saW51eAogUzoJU3VwcG9ydGVkCiBGOglkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmMKIEY6CWRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuaAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
