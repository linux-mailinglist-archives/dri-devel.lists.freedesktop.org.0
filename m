Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEDC21B0B9
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 09:54:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B6E89D83;
	Fri, 10 Jul 2020 07:53:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from v6.sk (v6.sk [167.172.42.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 666526EB55
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 01:09:13 +0000 (UTC)
Received: from localhost (v6.sk [IPv6:::1])
 by v6.sk (Postfix) with ESMTP id 5325760D19;
 Fri, 10 Jul 2020 01:09:11 +0000 (UTC)
From: Lubomir Rintel <lkundrak@v3.sk>
To: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v3 0/6] Generic USB Display driver
Date: Thu,  9 Jul 2020 18:32:35 +0200
Message-Id: <20200709163235.360054-1-lkundrak@v3.sk>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200529175643.46094-1-noralf@tronnes.org>
References: <20200529175643.46094-1-noralf@tronnes.org>
MIME-Version: 1.0
X-TUID: fTJ4QzHEkCkU
X-Mailman-Approved-At: Fri, 10 Jul 2020 07:52:58 +0000
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
Cc: balbi@kernel.org, linux-usb@vger.kernel.org, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, Lubomir Rintel <lkundrak@v3.sk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sCgpPbiAyOSBNYXkgMjAyMCBOb3JhbGYgVHLDuG5uZXMgd3JvdGU6Ci4uLgo+IFRoaXMg
c2VyaWVzIGFkZHMgYSBVU0IgaG9zdCBkcml2ZXIgYW5kIGEgZGV2aWNlL2dhZGdldCBkcml2ZXIg
dG8gYWNoaWV2ZQo+IHRoYXQuCj4gCj4gVGhlIHJlYXNvbiBmb3IgY2FsbGluZyBpdCAnR2VuZXJp
YycgaXMgc28gYW55b25lIGNhbiBtYWtlIGEgVVNCCj4gZGlzcGxheS9hZGFwdGVyIGFnYWluc3Qg
dGhpcyBkcml2ZXIsIGFsbCB0aGF0J3MgbmVlZGVkIGlzIHRvIGFkZCBhIFVTQgo+IHZpZDpwaWQu
IEkgaGF2ZSBkb25lIGEgbWljcm9jb250cm9sbGVyIGltcGxlbWVudGF0aW9uIGhhY2sganVzdCB0
byBzZWUKPiBob3cgdGhhdCB3b3VsZCB3b3JrIG91dFsxXSAod2hpY2ggdW5jb252ZXJlZCBhIGNv
dXBsZSBvZiBidWdzIGluIHRoZQo+IGhvc3QgZHJpdmVyKS4KLi4uCgpUaGlzIGlzIGFjdHVhbGx5
IHZlcnkgY29vbDsgZmluYWxseSBhIGdvb2Qgd2F5IHRvIGRyaXZlIHRoZSBjaGVhcG8KU1BJL0ky
QyBkaXNwbGF5cyBmcm9tIGNvbXB1dGVycyB3aG9zZSBvbmx5IG1lYW5zIG9mIGV4cGFuc2lvbiBp
cyBVU0IKd2l0aCBhIGxpdHRsZSBoZWxwIGZyb20gYSBtaWNyb2NvbnRyb2xsZXIuIEkndmUgYWN0
dWFsbHkgaGFkIHNvbWUKc3VjY2VzcyBkb2luZyBqdXN0IHRoYXQgWzFdLgoKWzFdIGh0dHBzOi8v
YXNzZXRzLm9jdG9kb24uc29jaWFsL21lZGlhX2F0dGFjaG1lbnRzL2ZpbGVzLzAwOS85ODMvOTYw
L29yaWdpbmFsLzY0YWQ4ZWE0NmMxYjA2YzUuanBnCgpJIHN1cHBvc2UgeW91IGNhbiBhZGQ6CgpU
ZXN0ZWQtYnk6IEx1Ym9taXIgUmludGVsIDxsa3VuZHJha0B2My5zaz4KCkkndmUgaGFkIHRvIGp1
bXAgdGhyb3VnaCBzb21lIGhvb3BzIHRob3VnaC4KCk15IE9MRUQgZGlzcGxheSBpcyBhIDEyOHg2
NCBTU0QxMzA2IFsxXSBkcml2ZW4gZnJvbSB0aGUgU1BJIGJ1cy4gVGhlIGZyYW1lCmJ1ZmZlciBT
UkFNIGlzIG5vcm1hbGx5IHNjYW5uZWQgb3V0IGluIHN0cmlwZXMgb2YgOCB2ZXJ0aWNhbCBwaXhl
bHMgY2FsbGVkCiJwYWdlcyIuIFdoZW4gdGhlIGRpc3BsYXkgaXMgdHVybmVkIG9uIGl0cyBzaWRl
LCB3aXRoICJ2ZXJ0aWNhbAphZGRyZXNzaW5nIG1vZGUiIGFuZCAic2VnbWVudCByZW1hcHBpbmci
IGVuYWJsZWQgYW5kIGJ5dGVzIGJlaW5nIHNlbnQgTFNCCmZpcnN0LCBpdCBhcHBlYXJzIGxpbmVh
ciAtLSBpdCdzIGVhc3kgdG8gcmVwYWludCB0aGUgd2hvbGUgZGlzcGxheSBmcm9tCndoYXQgaXMg
bm93IHRoZSB0b3AgbGVmdCBjb3JuZXIgdG8gdGhlIGJvdHRvbSByaWdodC4gVGhpcyBpcyB2ZXJ5
CmNvbnZlbmllbnQgZm9yIHBhaW50aW5nIHBpeGVscyBhcyB0aGV5IGNvbWUsIHdpdGhvdXQgYnVm
ZmVycmluZyB0aGVtIG9yCmRvaW5nIGFueSBjb252ZXJzaW9ucyAoYXNzdW1pbmcgdGhhdCBtZW1v
cnkgYW5kIGNwdSBjeWNsZXMgYXJlIGF0CnByZW1pdW0gb24gTUNVcykuCgpbMV0gaHR0cHM6Ly9j
ZG4tc2hvcC5hZGFmcnVpdC5jb20vZGF0YXNoZWV0cy9TU0QxMzA2LnBkZgoKVGhlcmUgZG9lc24n
dCBzZWVtIGEgY29tZm9ydGFibGUgd2F5IHRvIGRvIHBhcnRpYWwgcmVkcmF3cyB0aG91Z2guIFdv
dWxkCnlvdSBmaW5kIGl0IG9iamVjdGlvbmFibGUgaWYgdGhlIGRldmljZSBjb3VsZCBpbmRpY2F0
ZSB0aGF0IG5lZWRzIGZ1bGwKZnJhbWVzIGluc3RlYWQgb2YganVzdCB0aGUgZGFtYWdlZCBhcmVh
cz8gUGVyaGFwcyB0aGVuIHRoZSBkcml2ZXIKd291bGRuJ3QgZXZlbiBuZWVkIHRvIGJvdGhlciBp
c3N1aW5nIEdVRF9EUk1fVVNCX1JFUV9TRVRfQlVGRkVSIHRvCmRpc3BsYXlzIGR1bWIgZW5vdWdo
IHRvIGJlIGluY2FwYWJsZSBvZiBwYXJ0aWFsIHJlZHJhd3MgYW5kIGRlY29tcHJlc3Npb24uCgpN
eSB3b3JrLWluLXByb2dyZXNzIGNvZGUgdGhhdCB3b3JrcyBvbiBTVE0zMkYxMDMgKGUuZy4gIkJs
dWUgUGlsbCIKYm9hcmRzKSwgb3IgR0QzMlZGMTAzIChSSVNDLVYgIlBvbG9zIEFsZWYiKSBpcyBh
dCBbMl0uIFRoZSBwYXJ0aWFsIHJlZHJhd3MKdGhhdCBkb24ndCBzdGFydCBmcm9tIGNvbHVtbiB6
ZXJvIG9yIGFyZSBub3QgInBhZ2UgYWxpZ25lZCIgZG9uJ3Qgd29yawpjb3JyZWN0bHkgZm9yIHRo
ZSB0aW1lIGJlaW5nOyBYMTEgZG9lc24ndCBzZWVtIHRvIGNhcmUuCgpbMl0gaHR0cHM6Ly9naXRo
dWIuY29tL2hhY2tlcnNwYWNlL2xpYm9wZW5jbTMtZ2YzMnYtZXhhbXBsZXMvdHJlZS9sci9nZDMy
di9leGFtcGxlcy9nZDMydi9mMTAzL3BvbG9zLWFsZWYvdXNiLWRpc3BsYXkKClRoYW5rIHlvdSEK
THVibwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
