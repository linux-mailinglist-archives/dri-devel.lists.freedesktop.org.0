Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E923F61B9A
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 10:18:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A8488DF5;
	Mon,  8 Jul 2019 08:18:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 458EB88DF5
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 08:18:26 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 68C8F20023;
 Mon,  8 Jul 2019 10:18:23 +0200 (CEST)
Date: Mon, 8 Jul 2019 10:18:16 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Maya Rashish <coypu@sdf.org>
Subject: Re: [PATCH] Remove unused function drm_agp_bind_pages
Message-ID: <20190708081816.GA27604@ravnborg.org>
References: <20190707174009.GA13667@SDF.ORG>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190707174009.GA13667@SDF.ORG>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=NdeWFOKA-g3-99kuGnUA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWF5YS4KCk5pY2UgY2F0Y2ggLSBnb29kIHRvIHJlbW92ZSB1bnVzZWQgY3J1ZnQuCgpQbGVh
c2UgcHJlZml4IHRoZSBzdWJqZWN0IHdpdGggc29tZXRoaW5nIGxpa2UgImRybS9hZ3A6ICIuCkNo
ZWNrICJnaXQgbG9nIiBvbiB0aGUgc2FtZSBmaWxlIHRvIHBpY2sgdXAgdGhlIHVzdWFsIHdheSB0
byBpZGVudGlmeQphZ3Agc3BlY2lmaWMgY2hhbmdlcy4KCldpdGggdGhpcyBmaXhlZDoKUmV2aWV3
ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KCllvdSBjb3VsZCBhbHNvIGNv
bnNpZGVyIHRvIGFkZCBhIGZldyB3b3JkcyBpbiB0aGUgYm9keSBvZiB0aGUgY2hhbmdlbG9nCmhv
dyB0aGUgdW51c2VkIGZ1bmN0aW9uIHdhcyBpZGVudGlmaWVkLgoKCVNhbQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
