Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBLnIwbbfGlbOwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 17:23:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C3BBC7ED
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 17:23:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24EDF10EA14;
	Fri, 30 Jan 2026 16:23:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mark.filion@collabora.com header.b="ZKiHlAs3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E565210EA12
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 16:23:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1769790208; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=LCmhXm8us8RTbxfZiAcK5Q9hSOJHXBc8p0UvwDWkrR6vCs3VR4hN0Rk6JjunHvcsCE1IKhJZoz6m0+Ha3YOWxeu5PZ+oBTWRd0y4eO2eJv5MAEGoo9YgPvyiq/IdHPmrvizS5gPRCjxQt9w6+E+6JsFdHlKIx4BxE6ptPPbT3p8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1769790208;
 h=Content-Type:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=G7lYsj8j20TxYoMkO5KyiUoSb/7rcyWl3Ys/ptbVUg8=; 
 b=CzpxP7HsxSWZP0YhxLlT+IugrRmenPOUdMQKtyI9k4UXD4UDCGuAVzkZ3pOtM1apau0sS36sR7clWxPgHdRqfB4lzese8QYsOCJ7exg5KFHxQTf0siz1TWwCMpKxM53NgDNY+DnDPOcL5LWc3r+cphpkZgztiQIJLSzm5GRjHPE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mark.filion@collabora.com;
 dmarc=pass header.from=<mark.filion@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769790208; 
 s=zohomail; d=collabora.com; i=mark.filion@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:Content-Type:MIME-Version:Message-Id:Reply-To:Cc;
 bh=G7lYsj8j20TxYoMkO5KyiUoSb/7rcyWl3Ys/ptbVUg8=;
 b=ZKiHlAs36pYW8fauDJCgTltRGNQYCtEUKw1CxgbXsLp2/LqNobHnLL3IxMuNZueM
 WeKXbtBwp1rc+A05VUXDaOCGwaPm4Crpr4Yb26clMgsC7fqy5rdZ1MzNPWBqanYHUEG
 OFMwLSQaAQY050XxuoR/WVXY8fm3Jamvcl8xfeOc=
Received: by mx.zohomail.com with SMTPS id 1769790206573673.3693318837286;
 Fri, 30 Jan 2026 08:23:26 -0800 (PST)
Message-ID: <d19a72b8e57e64a6367776ac797f79c37481398b.camel@collabora.com>
Subject: Save the Date! XDC 2026 comes to Toronto
From: Mark Filion <mark.filion@collabora.com>
To: dri-devel@lists.freedesktop.org
Date: Fri, 30 Jan 2026 11:23:24 -0500
Content-Type: multipart/alternative; boundary="=-QF62hAx6YRySxfHltHG6"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43app1) 
MIME-Version: 1.0
X-ZohoMailClient: External
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.857];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,floss.social:url];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_ONE(0.00)[1];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mark.filion@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+]
X-Rspamd-Queue-Id: 29C3BBC7ED
X-Rspamd-Action: no action

--=-QF62hAx6YRySxfHltHG6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello!

We=E2=80=99re excited to announce that XDC 2026 will take place September 2=
8=E2=80=9330
in Toronto, Canada =E2=80=94 mark your calendars!

The conference will be held in person at Daniels Spectrum, a vibrant
community cultural hub in the heart of Toronto=E2=80=99s Regent Park
neighbourhood, just minutes from Yonge=E2=80=93Dundas Square.

We=E2=80=99d also like to extend a sincere thank you to Arm for organizing =
this
year=E2=80=99s conference and helping make XDC another great success.

Registration and the Call for Proposals will be opening soon, so stay
tuned!

Until then, be sure to follow us on Mastodon for the latest news and
updates:
https://floss.social/@XOrgDevConf

Best,

Mark

--=-QF62hAx6YRySxfHltHG6
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head><style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style></head><body><div>Hello!</div><div><br></div><div>We=E2=80=99re exc=
ited to announce that XDC 2026 will take place September 28=E2=80=9330 in T=
oronto, Canada =E2=80=94 mark your calendars!</div><div><br></div><div>The =
conference will be held in person at Daniels Spectrum, a vibrant community =
cultural hub in the heart of Toronto=E2=80=99s Regent Park neighbourhood, j=
ust minutes from Yonge=E2=80=93Dundas Square.</div><div><br></div><div>We=
=E2=80=99d also like to extend a sincere thank you to Arm for organizing th=
is year=E2=80=99s conference and helping make XDC another great success.</d=
iv><div><br></div><div>Registration and the Call for Proposals will be open=
ing soon, so stay tuned!</div><div><br></div><div>Until then, be sure to fo=
llow us on Mastodon for the latest news and updates:</div><div><a href=3D"h=
ttps://floss.social/@XOrgDevConf">https://floss.social/@XOrgDevConf</a></di=
v><div><br></div><div>Best,</div><div><br></div><div>Mark</div><div><span><=
/span></div></body></html>

--=-QF62hAx6YRySxfHltHG6--
