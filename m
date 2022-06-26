Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD0455B475
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 01:40:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A80EB10E05F;
	Sun, 26 Jun 2022 23:40:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CC1510E05F;
 Sun, 26 Jun 2022 23:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656286803; x=1687822803;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=ly06ZqpUiF/FzUAFeBuWMhThsJOTNW7nA8czeCMhAkA=;
 b=Bz+gkhvFCXmoOU2N64oNn0TpdfsmiHpZHqB4xNqzvYnxlkPjbGacxuBA
 nyI+FAkyxd8BR56BKTs8ugSd+Md58M/XlB06FNnvvUz8+xMue+HiKwegc
 ti0I5or2tkCCoNDnKKkmpE+Aifqwio74zgWCYMRIRPqaZL6e2G6/XwpQ4
 M1zf1Ovn7eeRY3hVq9Ic7zmststZkw8YvUydNCpoD8CFSh9rggUse4n/k
 GZM4wnCmqBbK2lkwO6FIYQGSrE5G6ZGB5V4kxJXJZh1SAgOjlKmtbtXlz
 QgIhLAH9BykmO+8rHLsCCIpKIm4RSROXcvoeEiR8cz5FhJmw8e70HnVO3 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10390"; a="306793995"
X-IronPort-AV: E=Sophos;i="5.92,225,1650956400"; d="scan'208";a="306793995"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2022 16:40:02 -0700
X-IronPort-AV: E=Sophos;i="5.92,225,1650956400"; d="scan'208";a="916471495"
Received: from sayansar-mobl.amr.corp.intel.com (HELO localhost)
 ([10.212.238.254])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2022 16:40:02 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <DM4PR11MB59952D0A2E4B2CA1B01E9BAFDCB49@DM4PR11MB5995.namprd11.prod.outlook.com>
References: <20220623144955.2486736-1-imre.deak@intel.com>
 <DM4PR11MB59952D0A2E4B2CA1B01E9BAFDCB49@DM4PR11MB5995.namprd11.prod.outlook.com>
Subject: Re: [Intel-gfx] [PATCH] drm/fourcc: Document the Intel CCS modifiers'
 CC plane expected pitch
From: Jordan Justen <jordan.l.justen@intel.com>
To: "Chery, Nanley G" <nanley.g.chery@intel.com>, "Deak,
 Imre" <imre.deak@intel.com>, dri-devel@lists.freedesktop.org
Date: Sun, 26 Jun 2022 16:39:56 -0700
Message-ID: <165628679614.852381.2513560615822591267@jljusten-skl>
User-Agent: alot/0.10
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-06-24 14:38:50, Chery, Nanley G wrote:
> +Jordan (FYI)
>=20
> I think the commit message has an extra "color" next to "CC".=20
> With or without that dropped,
>=20
> Reviewed-by: Nanley Chery <nanley.g.chery@intel.com>

Reviewed-by: Jordan Justen <jordan.l.justen@intel.com>
