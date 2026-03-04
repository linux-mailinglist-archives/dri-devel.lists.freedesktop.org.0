Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2gzuEgZaqGmZtgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 17:12:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D532D203EAD
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 17:12:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B6810EA53;
	Wed,  4 Mar 2026 16:12:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mark.filion@collabora.com header.b="B1gXa7u/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C164210EA4E;
 Wed,  4 Mar 2026 16:12:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1772640762; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=kRUk4O3CAkzGxMf6lwluro+2/Zz82AxFHdSBn1AVH9XeEFz+DgVJiTQ55KyJWsrIYa2OHiRKthYJEV3YdQcOaM8KUF6gCG5IXgVk6EJiFrPv0xDaFLsO7Q0AHgVcNE7ZwSfC1qE3+i9L23m89rRu1bxwXgxULFEfPuyJfIoHTY8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1772640762;
 h=Content-Type:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=/UZ1fASd581DGwoDXE4nNr7cvDBmu2IMPO2n0Z57d0s=; 
 b=SGcUttgqGNnv57CByEPkn2GSqhC8MLfPmEtHn+a8SixdvwPNhPkSlqN6dpLdT+WrKxOTDSbtalIR1wl4vvoMLr7X8q4idoRkqLhpodm27Z+HokzaZxV8Kdf7l6UjnP/Zb2GlhW9hmEsHVR8iy1ypnrJ0q3cr2I2dN5/fnCM9yiw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mark.filion@collabora.com;
 dmarc=pass header.from=<mark.filion@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772640762; 
 s=zohomail; d=collabora.com; i=mark.filion@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:In-Reply-To:References:Content-Type:MIME-Version:Message-Id:Reply-To:Cc;
 bh=/UZ1fASd581DGwoDXE4nNr7cvDBmu2IMPO2n0Z57d0s=;
 b=B1gXa7u/vRyCFytF/C2IblGhO61hhskl0NxSWvE4ckYXxcyO3lXkjGW5PLb21kLJ
 7zUNCZSLQDYxOMUSaI2QzOSxgdXaaJw52Ifa/nPOtmCPc/Le9XQPO2rK4E3+jyRFrmn
 iItL/LjFC98h7dSQv+5LA3setfy05ivchT3QNeoY=
Received: by mx.zohomail.com with SMTPS id 1772640759959464.1568830656362;
 Wed, 4 Mar 2026 08:12:39 -0800 (PST)
Message-ID: <77e280436ec5b54973a11303dd0446e9f3ab2ba1.camel@collabora.com>
Subject: Reminder: Deadline to renew X.Org memberships for 2026 is March 16.
From: Mark Filion <mark.filion@collabora.com>
To: events@lists.x.org, xorg-devel@lists.x.org, 
 wayland-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 mesa-dev@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 libre-soc-dev@lists.libre-soc.org, elections@x.org, members@x.org, 
 xorg@lists.freedesktop.org
Date: Wed, 04 Mar 2026 11:12:37 -0500
In-Reply-To: <0070f3dd-a521-40ee-b6e7-8b1f82e48b66@amd.com>
References: <0070f3dd-a521-40ee-b6e7-8b1f82e48b66@amd.com>
Content-Type: multipart/alternative; boundary="=-Ou9PVGv0Q/xGWensQ9B3"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43app2) 
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
X-Rspamd-Queue-Id: D532D203EAD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,x.org:url,x.org:email];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mark.filion@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[collabora.com:+]
X-Rspamd-Action: no action

--=-Ou9PVGv0Q/xGWensQ9B3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

Just a friendly reminder that the deadline to renew X.Org memberships
for 2026 is March 16.

Membership renewal ensures you maintain your voting rights in the
upcoming foundation elections, but also helps strengthen the foundation
by giving it more credibility.

https://members.x.org/

Thank you for your continued support of the X.Org Foundation.

Best,

Mark

On Wed, 2026-02-04 at 16:22 -0500, Harry Wentland wrote:
> Hi all,
>=20
> it's a new year and with that a new X.Org Board of Directors
> election. Please take the time to log in to members.x.org
> and renew your membership for the new period or sign up for
> the first time.
>=20
> These board members' periods will end this year:
> - Mark Filion
> - Erik Faye-Lund
> - Simon Ser
> - Neal Gompa
>=20
> The election dates will be as follows:
> =C2=A0=C2=A0=C2=A0 Nomination period Start: Mon February 9th
> =C2=A0=C2=A0=C2=A0 Nomination period End: Mon March 9th
> =C2=A0=C2=A0=C2=A0 Publication of Candidates & start of Candidate QA: Mon=
 March 16th
> =C2=A0=C2=A0=C2=A0 Deadline of X.Org membership application or renewal: M=
on March
> 16th
> =C2=A0=C2=A0=C2=A0 Election Planned Start: Mon March 23rd
> =C2=A0=C2=A0=C2=A0 Election Planned End: Mon April 13th
>=20
> If you have questions or encounter issues don't hesitate
> to reach out the Elections Committee at elections@x.org.
>=20
> Best Regards,
> Harry

--=-Ou9PVGv0Q/xGWensQ9B3
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
</style></head><body><div>Hi everyone,</div><div><br></div><div><div>Just a=
 friendly reminder that the deadline to renew X.Org memberships for 2026 is=
 March 16.</div><div><br></div><div>Membership renewal ensures you maintain=
 your voting rights in the upcoming foundation elections, but also helps st=
rengthen the foundation by giving it more credibility.<br><br><a href=3D"ht=
tps://members.x.org/">https://members.x.org/</a></div><div><br></div><div>T=
hank you for your continued support of the X.Org Foundation.</div><div><br>=
</div><div>Best,</div><div></div><br>Mark<br><br>On Wed, 2026-02-04 at 16:2=
2 -0500, Harry Wentland wrote:</div><blockquote type=3D"cite" style=3D"marg=
in:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><div>Hi all,=
<br></div><div><br></div><div>it's a new year and with that a new X.Org Boa=
rd of Directors<br></div><div>election. Please take the time to log in to m=
embers.x.org<br></div><div>and renew your membership for the new period or =
sign up for<br></div><div>the first time.<br></div><div><br></div><div>Thes=
e board members' periods will end this year:<br></div><div>- Mark Filion<br=
></div><div>- Erik Faye-Lund<br></div><div>- Simon Ser<br></div><div>- Neal=
 Gompa<br></div><div><br></div><div>The election dates will be as follows:<=
br></div><div>&nbsp;&nbsp;&nbsp; Nomination period Start: Mon February 9th<=
br></div><div>&nbsp;&nbsp;&nbsp; Nomination period End: Mon March 9th<br></=
div><div>&nbsp;&nbsp;&nbsp; Publication of Candidates &amp; start of Candid=
ate QA: Mon March 16th<br></div><div>&nbsp;&nbsp;&nbsp; Deadline of X.Org m=
embership application or renewal: Mon March 16th<br></div><div>&nbsp;&nbsp;=
&nbsp; Election Planned Start: Mon March 23rd<br></div><div>&nbsp;&nbsp;&nb=
sp; Election Planned End: Mon April 13th<br></div><div><br></div><div>If yo=
u have questions or encounter issues don't hesitate<br></div><div>to reach =
out the Elections Committee at <a href=3D"mailto:elections@x.org">elections=
@x.org</a>.<br></div><div><br></div><div>Best Regards,<br></div><div>Harry<=
br></div></blockquote><div><br></div><div><span></span></div></body></html>

--=-Ou9PVGv0Q/xGWensQ9B3--
